--[[

ttc-update.lua

Reads pricedata and updates the database with the current suggested prices.

--]]

-- -----------------------------------------------------------------------------
function get_first_index( t )
   local i = -1
   for k,v in pairs( t ) do
      i = k
      break
   end
   return i
end

-- -----------------------------------------------------------------------------
function get_first_value( t )
   local i = -1
   for k,v in pairs( t ) do
      i = v
      break
   end
   return i
end

-- -----------------------------------------------------------------------------

TamrielTradeCentre = {}
function TamrielTradeCentre:new (o)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   return o
end

require ( "ItemLookUpTable_EN" )

-- -----------------------------------------------------------------------------
TamrielTradeCentrePrice = {}
function TamrielTradeCentrePrice:new (o)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   return o
end

require ( "PriceTableNA" )

-- -----------------------------------------------------------------------------

inifile = require('inifile')
conf = inifile.parse( 'config.ini' )

mysql = require "luasql.mysql"

db_env = assert( mysql.mysql() )
db = assert( db_env:connect( conf['Database']['Database'], conf['Database']['User'], conf['Database']['Password'] ) )

db_cursor = assert( db:execute( "SELECT name FROM materials ORDER BY name" ) )
i = 1
item_names = {}
row = db_cursor:fetch( {}, "a" )
while row do
   item_names[i] = row.name
   i = i + 1
   row = db_cursor:fetch( {}, "a" )
end


ttc = TamrielTradeCentre:new()
ttc_price = TamrielTradeCentrePrice:new()

ttc:LoadItemLookUpTable()
ttc_price:LoadPriceTableNA()

for i,item_name in ipairs(item_names) do
   lookup_entry = ttc.ItemLookUpTable[item_name:lower()]
   if ( lookup_entry == nil ) then
      print( "No lookup entry for " .. item_name )
   else
      item_index = get_first_value( lookup_entry )
      if ( item_index == nil ) then
         print( "No item index for " .. item_name )
      else
         qualityDict = ttc_price.PriceTable["Data"][item_index]
         if ( qualityDict == nil ) then
            print( "No qualityDict for " .. item_name )
         else
            quality = get_first_index( qualityDict )
            levelDict = qualityDict[quality]
            if ( levelDict == nil ) then
               print( "No levelDict for " .. item_name )
            else
               level = get_first_index( levelDict )
               traitDict = levelDict[level]
               if ( traitDict == nil ) then
                  print( "No traitDict for " .. item_name )
               else
                  trait = get_first_index( traitDict )
                  priceDict = traitDict[trait]
                  if ( priceDict == nil ) then
                     print( "No priceDict for " .. item_name )
                  else
                     suggested_price = priceDict["SuggestedPrice"]
                     if ( suggested_price ~= nil ) then
                        suggested_price = suggested_price * 1.25 -- Use TTC high end suggested price
                        db_cursor = assert( db:execute( string.format( 'UPDATE materials SET price = "%s" WHERE name = "%s"', suggested_price, item_name ) ) )
                     else
                        print( "No suggested price for " .. item_name )
                        suggested_price = priceDict["AveragePrice"]
                        if ( suggested_price == nil ) then
                           print( "No average price for " .. item_name )
                        else
                           suggested_price = suggested_price * 1.25
                           db_cursor = assert( db:execute( string.format( 'UPDATE materials SET price = "%s" WHERE name = "%s"', suggested_price, item_name ) ) )
                        end
                     end
                  end
               end
            end
         end
      end
   end
end

db:close()
db_env:close()

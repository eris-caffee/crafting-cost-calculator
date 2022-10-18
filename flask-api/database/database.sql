-- DROP DATABASE IF EXISTS `crafting_cost_calculator`;
-- CREATE DATABASE 'crafting_cost_calculator';

USE `crafting_cost_calculator`;

SET foreign_key_checks = 0;

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `materials`;
CREATE TABLE `materials` (
        `id`    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`  CHAR(32)        NOT NULL DEFAULT "",
        `price` FLOAT           NOT NULL DEFAULT 1000000
) ENGINE InnoDB;

INSERT INTO `materials` SET `id` = 1, `name` = 'Ancestor Silk';
INSERT INTO `materials` SET `id` = 2, `name` = 'Rubedo Leather';
INSERT INTO `materials` SET `id` = 3, `name` = 'Rubedite Ingot';
INSERT INTO `materials` SET `id` = 4, `name` = 'Sanded Ruby Ash';
INSERT INTO `materials` SET `id` = 5, `name` = 'Platinum Ounce';
INSERT INTO `materials` SET `id` = 6, `name` = 'Hemming';
INSERT INTO `materials` SET `id` = 7, `name` = 'Embroidery';
INSERT INTO `materials` SET `id` = 8, `name` = 'Elegant Lining';
INSERT INTO `materials` SET `id` = 9, `name` = 'Dreugh Wax';
INSERT INTO `materials` SET `id` = 10, `name` = 'Pitch';
INSERT INTO `materials` SET `id` = 11, `name` = 'Turpen';
INSERT INTO `materials` SET `id` = 12, `name` = 'Mastic';
INSERT INTO `materials` SET `id` = 13, `name` = 'Rosin';
INSERT INTO `materials` SET `id` = 14, `name` = 'Terne Plating';
INSERT INTO `materials` SET `id` = 15, `name` = 'Iridium Plating';
INSERT INTO `materials` SET `id` = 16, `name` = 'Zircon Plating';
INSERT INTO `materials` SET `id` = 17, `name` = 'Chromium Plating';
INSERT INTO `materials` SET `id` = 18, `name` = 'Quartz';
INSERT INTO `materials` SET `id` = 19, `name` = 'Diamond';
INSERT INTO `materials` SET `id` = 20, `name` = 'Sardonyx';
INSERT INTO `materials` SET `id` = 21, `name` = 'Almandine';
INSERT INTO `materials` SET `id` = 22, `name` = 'Emerald';
INSERT INTO `materials` SET `id` = 23, `name` = 'Bloodstone';
INSERT INTO `materials` SET `id` = 24, `name` = 'Garnet';
INSERT INTO `materials` SET `id` = 25, `name` = 'Sapphire';
INSERT INTO `materials` SET `id` = 26, `name` = 'Fortified Nirncrux';
INSERT INTO `materials` SET `id` = 27, `name` = 'Chysolite';
INSERT INTO `materials` SET `id` = 28, `name` = 'Amethyst';
INSERT INTO `materials` SET `id` = 29, `name` = 'Ruby';
INSERT INTO `materials` SET `id` = 30, `name` = 'Jade';
INSERT INTO `materials` SET `id` = 31, `name` = 'Turquoise';
INSERT INTO `materials` SET `id` = 32, `name` = 'Carnelian';
INSERT INTO `materials` SET `id` = 33, `name` = 'Fire Opal';
INSERT INTO `materials` SET `id` = 34, `name` = 'Citrine';
INSERT INTO `materials` SET `id` = 35, `name` = 'Potent Nirncrux';
INSERT INTO `materials` SET `id` = 36, `name` = 'Zinc';
INSERT INTO `materials` SET `id` = 37, `name` = 'Antimony';
INSERT INTO `materials` SET `id` = 38, `name` = 'Cobalt';
INSERT INTO `materials` SET `id` = 39, `name` = 'Slaughterstone';
INSERT INTO `materials` SET `id` = 40, `name` = 'Dibellium';
INSERT INTO `materials` SET `id` = 41, `name` = 'Aurbic Amber';
INSERT INTO `materials` SET `id` = 42, `name` = 'Titanium';
INSERT INTO `materials` SET `id` = 43, `name` = 'Gilding Wax';
INSERT INTO `materials` SET `id` = 44, `name` = 'Dawn-prism';
INSERT INTO `materials` SET `id` = 45, `name` = 'Honing Stone';
INSERT INTO `materials` SET `id` = 46, `name` = 'Dwarven Oil';
INSERT INTO `materials` SET `id` = 47, `name` = 'Grain Solvent';
INSERT INTO `materials` SET `id` = 48, `name` = 'Tempering Alloy';
-- Deleted some duplicate rows, so there's a gap in the numbers
INSERT INTO `materials` SET `id` = 61, `name` = "Adamantite";
INSERT INTO `materials` SET `id` = 62, `name` = "Obsidian";
INSERT INTO `materials` SET `id` = 63, `name` = "Bone";
INSERT INTO `materials` SET `id` = 64, `name` = "Corundum";
INSERT INTO `materials` SET `id` = 65, `name` = "Molybdenum";
INSERT INTO `materials` SET `id` = 66, `name` = "Starmetal";
INSERT INTO `materials` SET `id` = 67, `name` = "Moonstone";
INSERT INTO `materials` SET `id` = 68, `name` = "Manganese";
INSERT INTO `materials` SET `id` = 69, `name` = "Flint";
INSERT INTO `materials` SET `id` = 70, `name` = "Nickel";
INSERT INTO `materials` SET `id` = 71, `name` = "Palladium";
INSERT INTO `materials` SET `id` = 72, `name` = "Copper Ounce";
INSERT INTO `materials` SET `id` = 73, `name` = "Argentum";
INSERT INTO `materials` SET `id` = 74, `name` = "Daedra Heart";
INSERT INTO `materials` SET `id` = 75, `name` = "Dwemer Frame";
INSERT INTO `materials` SET `id` = 76, `name` = "Malachite";
INSERT INTO `materials` SET `id` = 77, `name` = "Charcoal of Remorse";
INSERT INTO `materials` SET `id` = 78, `name` = "Goldscale";
INSERT INTO `materials` SET `id` = 79, `name` = "Laurel";
INSERT INTO `materials` SET `id` = 80, `name` = "Ferrous Salts";
INSERT INTO `materials` SET `id` = 81, `name` = "Cassiterite";
INSERT INTO `materials` SET `id` = 82, `name` = "Auric Tusk";
INSERT INTO `materials` SET `id` = 83, `name` = "Potash";
INSERT INTO `materials` SET `id` = 84, `name` = "Rogue's Soot"; -- '
INSERT INTO `materials` SET `id` = 85, `name` = "Eagle Feather";
INSERT INTO `materials` SET `id` = 86, `name` = "Lion Fang";
INSERT INTO `materials` SET `id` = 87, `name` = "Dragon Scute";
INSERT INTO `materials` SET `id` = 88, `name` = "Ancient Sandstone";
INSERT INTO `materials` SET `id` = 89, `name` = "Azure Plasm";
INSERT INTO `materials` SET `id` = 90, `name` = "Boiled Carapace";
INSERT INTO `materials` SET `id` = 91, `name` = "Wolfsbane Incense";
INSERT INTO `materials` SET `id` = 92, `name` = "Polished Shilling";
INSERT INTO `materials` SET `id` = 93, `name` = "Fine Chalk";
INSERT INTO `materials` SET `id` = 94, `name` = "Tainted Blood";
INSERT INTO `materials` SET `id` = 95, `name` = "Defiled Whiskers";
INSERT INTO `materials` SET `id` = 96, `name` = "Black Beeswax";
INSERT INTO `materials` SET `id` = 97, `name` = "Night Pumice";
INSERT INTO `materials` SET `id` = 98, `name` = "Pristine Shroud";
INSERT INTO `materials` SET `id` = 99, `name` = "Oxblood Fungus";
INSERT INTO `materials` SET `id` = 100, `name` = "Pearl Sand";
INSERT INTO `materials` SET `id` = 101, `name` = "Star Sapphire";
INSERT INTO `materials` SET `id` = 102, `name` = "Amber Marble";
INSERT INTO `materials` SET `id` = 103, `name` = "Grinstones";
INSERT INTO `materials` SET `id` = 104, `name` = "Distilled Slowsilver";
INSERT INTO `materials` SET `id` = 105, `name` = "Leviathan Scrimshaw";
INSERT INTO `materials` SET `id` = 106, `name` = "Stalhrim Shard";
INSERT INTO `materials` SET `id` = 107, `name` = "Volcanic Viridian";
INSERT INTO `materials` SET `id` = 108, `name` = "Ash Canvas";
INSERT INTO `materials` SET `id` = 109, `name` = "Lustrous Sphalerite";
INSERT INTO `materials` SET `id` = 110, `name` = "Wrought Ferrofungus";
INSERT INTO `materials` SET `id` = 111, `name` = "Polished Scarab Elytra";
INSERT INTO `materials` SET `id` = 112, `name` = "Refined Bonemold Resin";

INSERT INTO `materials` SET `id` = 114, `name` = "Bloodroot Flux";
INSERT INTO `materials` SET `id` = 115, `name` = "Minotaur Bezoar";
INSERT INTO `materials` SET `id` = 116, `name` = "Tempered Brass";
INSERT INTO `materials` SET `id` = 117, `name` = "Tenebrous Cord";
INSERT INTO `materials` SET `id` = 118, `name` = "Dragon Bone";
INSERT INTO `materials` SET `id` = 119, `name` = "Infected Flesh";
INSERT INTO `materials` SET `id` = 120, `name` = "Desecrated Grave Soil";
INSERT INTO `materials` SET `id` = 121, `name` = "Vitrified Malondo";
INSERT INTO `materials` SET `id` = 122, `name` = "Culanda Lacquer";
INSERT INTO `materials` SET `id` = 123, `name` = "Warrior's Heart Ashes"; -- '
INSERT INTO `materials` SET `id` = 124, `name` = "Sea Serpent Hide";
INSERT INTO `materials` SET `id` = 125, `name` = "Bloodscent Dew";
INSERT INTO `materials` SET `id` = 126, `name` = "Argent Pelt";
INSERT INTO `materials` SET `id` = 127, `name` = "Gryphon Plume";
INSERT INTO `materials` SET `id` = 128, `name` = "Red Diamond Seal";
INSERT INTO `materials` SET `id` = 129, `name` = "Crocodile Leather";
INSERT INTO `materials` SET `id` = 130, `name` = "Hackwing Plumage";
INSERT INTO `materials` SET `id` = 131, `name` = "Goblin-Cloth Scrap";
INSERT INTO `materials` SET `id` = 132, `name` = "Auroran Dust";
INSERT INTO `materials` SET `id` = 133, `name` = "Shimmering Sand";
INSERT INTO `materials` SET `id` = 134, `name` = "Dragonthread";
INSERT INTO `materials` SET `id` = 135, `name` = "Frost Embers";
INSERT INTO `materials` SET `id` = 136, `name` = "Gilding Salts";
INSERT INTO `materials` SET `id` = 137, `name` = "Oath Cord";
INSERT INTO `materials` SET `id` = 138, `name` = "Blood of Sahrotnax";
INSERT INTO `materials` SET `id` = 139, `name` = "Polished Rivets";
INSERT INTO `materials` SET `id` = 140, `name` = "Carmine Shieldsilk";
INSERT INTO `materials` SET `id` = 141, `name` = "Aeonstone Shard";
INSERT INTO `materials` SET `id` = 142, `name` = "Fryse Willow";
INSERT INTO `materials` SET `id` = 143, `name` = "Consecrated Myrrh";
INSERT INTO `materials` SET `id` = 144, `name` = "Gloomspore Chitin";
INSERT INTO `materials` SET `id` = 145, `name` = "Bat Oil";
INSERT INTO `materials` SET `id` = 146, `name` = "Sea Snake Fang";
INSERT INTO `materials` SET `id` = 147, `name` = "Etched Corundum";
INSERT INTO `materials` SET `id` = 148, `name` = "Etched Manganese";
INSERT INTO `materials` SET `id` = 149, `name` = "Etched Adamantite";
INSERT INTO `materials` SET `id` = 150, `name` = "Thorn Sigil";
INSERT INTO `materials` SET `id` = 151, `name` = "Viridian Phial";
INSERT INTO `materials` SET `id` = 152, `name` = "Burnished Goldscale";
INSERT INTO `materials` SET `id` = 153, `name` = "Etched Molybdenum";
INSERT INTO `materials` SET `id` = 154, `name` = "Etched Bronze";
INSERT INTO `materials` SET `id` = 155, `name` = "Umbral Droplet";
INSERT INTO `materials` SET `id` = 156, `name` = "Arkthzand Sprocket";
INSERT INTO `materials` SET `id` = 157, `name` = "Hawk Skull";
INSERT INTO `materials` SET `id` = 158, `name` = "Etched Nickel";
INSERT INTO `materials` SET `id` = 159, `name` = "Chokeberry Extract";
INSERT INTO `materials` SET `id` = 160, `name` = "Fulgid Epidote";
INSERT INTO `materials` SET `id` = 161, `name` = "Ivory Brigade Clasp";
INSERT INTO `materials` SET `id` = 162, `name` = "Death Hopper Vocal Sac";
INSERT INTO `materials` SET `id` = 163, `name` = "Marsh Nettle Sprig";
INSERT INTO `materials` SET `id` = 164, `name` = "Pristine Daedric Heart";
INSERT INTO `materials` SET `id` = 165, `name` = "Filed Barbs";
INSERT INTO `materials` SET `id` = 166, `name` = "Rose Engraving";
INSERT INTO `materials` SET `id` = 167, `name` = "Blaze-Veined Prism";
INSERT INTO `materials` SET `id` = 168, `name` = "Indigo Lucent";
INSERT INTO `materials` SET `id` = 169, `name` = "Squid Ink";
INSERT INTO `materials` SET `id` = 170, `name` = "Bone Pyre Ash";
INSERT INTO `materials` SET `id` = 171, `name` = "Scalloped Frog-Metal";
INSERT INTO `materials` SET `id` = 172, `name` = "Stendarr Stamp";
INSERT INTO `materials` SET `id` = 173, `name` = "High Isle Filigree";

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `armor_types`;
CREATE TABLE `armor_types` (
        `id`    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`  CHAR(32)        NOT NULL
) ENGINE InnoDB;

INSERT INTO `armor_types` SET `id` = 1, `name` = 'Light';
INSERT INTO `armor_types` SET `id` = 2, `name` = 'Medium';
INSERT INTO `armor_types` SET `id` = 3, `name` = 'Heavy';

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `crafting_types`;
CREATE TABLE `crafting_types` (
        `id`    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`  CHAR(32)        NOT NULL DEFAULT ""
) ENGINE InnoDB;

INSERT INTO `crafting_types` SET `id` = 1, `name` = 'Clothier';
INSERT INTO `crafting_types` SET `id` = 2, `name` = 'Woodworking';
INSERT INTO `crafting_types` SET `id` = 3, `name` = 'Blacksmithing';
INSERT INTO `crafting_types` SET `id` = 4, `name` = 'Jewelry Crafting';

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `item_types`;
CREATE TABLE `item_types` (
        `id`    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`  CHAR(32)        NOT NULL DEFAULT ""
) ENGINE InnoDB;

INSERT INTO `item_types` SET `id` = 1, `name` = 'Weapon';
INSERT INTO `item_types` SET `id` = 2, `name` = 'Armor';
INSERT INTO `item_types` SET `id` = 3, `name` = 'Jewelry';

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `traits`;
CREATE TABLE `traits` (
        `id`                    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`                  CHAR(32)        NOT NULL DEFAULT "",
        `description`           CHAR(255)       NOT NULL DEFAULT "",
        `material_id`           INT             NOT NULL,
        `item_type_id`          INT             NOT NULL,
        FOREIGN KEY (`material_id`)     REFERENCES `materials` (`id`),
        FOREIGN KEY (`item_type_id`)    REFERENCES `item_types` (`id`)
) ENGINE InnoDB;

INSERT INTO `traits` SET `id` = 1, `name` = 'Sturdy', `description` = 'Reduces the cost of Block.', `material_id` = 18, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 2, `name` = 'Impenetrable', `description` = 'Increases Critical Resistance and this item takes 50% less durability damage.', `material_id` = 19, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 3, `name` = 'Reinforced', `description` = 'Increases Armor value.', `material_id` = 20, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 4, `name` = 'Well-fitted', `description` = 'Reduces the cost of Roll Dodge and Sprint.', `material_id` = 21, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 5, `name` = 'Training', `description` = 'Increase experience gained from kills.', `material_id` = 22, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 6, `name` = 'Infused', `description` = 'Increases enchantment effects of this item.', `material_id` = 23, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 7, `name` = 'Invigorating', `description` = 'Increases Health, Magicka, and Stamina Recovery.', `material_id` = 24, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 8, `name` = 'Divines', `description` = 'Increases Mundus Stone effects.', `material_id` = 25, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 9, `name` = 'Nirnhoned', `description` = 'Increases Physical and Spell Resistance.', `material_id` = 26, `item_type_id` = 2;

INSERT INTO `traits` SET `id` = 10, `name` = 'Powered', `description` = 'Increases healing done.', `material_id` = 27, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 11, `name` = 'Charged', `description` = 'Increases chance to apply a status effect to your target.', `material_id` = 28, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 12, `name` = 'Precise', `description` = 'Increases Weapon and Spell Critical.', `material_id` = 29, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 13, `name` = 'Infused', `description` = 'Increases enchantment effects of this item.', `material_id` = 30, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 14, `name` = 'Defending', `description` = 'Increases physical and spell resistance.', `material_id` = 31, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 15, `name` = 'Training', `description` = 'Increases experience from kills.', `material_id` = 32, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 16, `name` = 'Sharpened', `description` = 'Increases your Physical and Spell Penetration.', `material_id` = 33, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 17, `name` = 'Decisive', `description` = 'When you gain Ultimate you have a chance to gain 1 additional Ultimate.', `material_id` = 34, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 18, `name` = 'Nirnhoned', `description` = 'Increases damage of this weapon.', `material_id` = 35, `item_type_id` = 1;

INSERT INTO `traits` SET `id` = 19, `name` = 'Robust', `description` = 'Increases Maximum Stamina.', `material_id` = 36, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 20, `name` = 'Healthy', `description` = 'Increases Maximum Health.', `material_id` = 37, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 21, `name` = 'Arcane', `description` = 'Increases Maximum Magicka.', `material_id` = 38, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 22, `name` = 'Bloodthirsty', `description` = 'Increases Weapon and Spell Damage.', `material_id` = 39, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 23, `name` = 'Harmony', `description` = 'Increases damage, healing, resource restore, and damage shield strength of synergies you activate.', `material_id` = 40, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 24, `name` = 'Infused', `description` = 'Increases enchantment effects of this item.', `material_id` = 41, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 25, `name` = 'Protective', `description` = 'Increases Physical and Spell Resistance.', `material_id` = 42, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 26, `name` = 'Swift', `description` = 'Increases movement speed.', `material_id` = 43, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 27, `name` = 'Triune', `description` = 'Increases Maximum Magicka, Stamina, and Health.', `material_id` = 44, `item_type_id` = 3;

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
        `id`                    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`                  CHAR(32)        NOT NULL DEFAULT "",
        `material_id`           INT             NOT NULL,
        `num_materials`         INT             NOT NULL,
        `item_type_id`          INT             NOT NULL,
        `crafting_type_id`      INT             NOT NULL,
        `armor_type_id`         INT             DEFAULT NULL,
        KEY `craft_item` (`item_type_id`, `crafting_type_id`),
        FOREIGN KEY (`material_id`)             REFERENCES `materials` (`id`),
        FOREIGN KEY (`item_type_id`)            REFERENCES `item_types` (`id`),
        FOREIGN KEY (`crafting_type_id`)        REFERENCES `crafting_types` (`id`),
        FOREIGN KEY (`armor_type_id`)           REFERENCES `armor_types` (`id`)
) ENGINE InnoDB;

INSERT INTO `items` SET `id` = 1, `num_materials` = 150, `name` = 'Cuirass', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 2, `num_materials` = 130, `name` = 'Sabatons', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 3, `num_materials` = 130, `name` = 'Gauntlets', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 4, `num_materials` = 130, `name` = 'Helm', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 5, `num_materials` = 140, `name` = 'Greaves', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 6, `num_materials` = 130, `name` = 'Pauldron', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 7, `num_materials` = 130, `name` = 'Girdle', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;

INSERT INTO `items` SET `id` = 8, `num_materials` = 150, `name` = 'Jack', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 9, `num_materials` = 130, `name` = 'Bracers', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 10, `num_materials` = 130, `name` = 'Belt', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 11, `num_materials` = 140, `name` = 'Guards', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 12, `num_materials` = 130, `name` = 'Boots', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 13, `num_materials` = 130, `name` = 'Helmet', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 14, `num_materials` = 130, `name` = 'Arm Cops', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;

INSERT INTO `items` SET `id` = 15, `num_materials` = 150, `name` = 'Robe', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 16, `num_materials` = 130, `name` = 'Jerkin', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 17, `num_materials` = 130, `name` = 'Gloves', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 18, `num_materials` = 140, `name` = 'Sash', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 19, `num_materials` = 130, `name` = 'Breeches', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 20, `num_materials` = 130, `name` = 'Shoes', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 21, `num_materials` = 130, `name` = 'Hat', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 22, `num_materials` = 130, `name` = 'Epaulets', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;

INSERT INTO `items` SET `id` = 23, `num_materials` = 110, `name` = 'Axe', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 24, `num_materials` = 110, `name` = 'Mace', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 25, `num_materials` = 110, `name` = 'Sword', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 26, `num_materials` = 140, `name` = 'Battle Axe', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 27, `num_materials` = 140, `name` = 'Maul', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 28, `num_materials` = 140, `name` = 'Greatsword', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 29, `num_materials` = 100, `name` = 'Dagger', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;

INSERT INTO `items` SET `id` = 30, `num_materials` = 120, `name` = 'Bow', `material_id` = 4, `item_type_id` = 1, `crafting_type_id` = 2;
INSERT INTO `items` SET `id` = 31, `num_materials` = 120, `name` = 'Lightning Staff', `material_id` = 4, `item_type_id` = 1, `crafting_type_id` = 2;
INSERT INTO `items` SET `id` = 32, `num_materials` = 120, `name` = 'Ice Staff', `material_id` = 4, `item_type_id` = 1, `crafting_type_id` = 2;
INSERT INTO `items` SET `id` = 33, `num_materials` = 120, `name` = 'Inferno Staff', `material_id` = 4, `item_type_id` = 1, `crafting_type_id` = 2;
INSERT INTO `items` SET `id` = 34, `num_materials` = 120, `name` = 'Healing Staff', `material_id` = 4, `item_type_id` = 1, `crafting_type_id` = 2;

INSERT INTO `items` SET `id` = 35, `num_materials` = 160, `name` = 'Shield', `material_id` = 4, `item_type_id` = 2, `crafting_type_id` = 2;

INSERT INTO `items` SET `id` = 36, `num_materials` = 150, `name` = 'Necklace', `material_id` = 5, `item_type_id` = 3, `crafting_type_id` = 4;
INSERT INTO `items` SET `id` = 37, `num_materials` = 100, `name` = 'Ring', `material_id` = 5, `item_type_id` = 3, `crafting_type_id` = 4;

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `motifs`;
CREATE TABLE `motifs` (
        `id`                    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`                  CHAR(32)        NOT NULL DEFAULT "",
        `material_id`           INT             NOT NULL
) ENGINE InnoDB;

INSERT INTO `motifs` SET `id` = 1, `name` = "High Elf", `material_id` = 61;
INSERT INTO `motifs` SET `id` = 2, `name` = "Dark Elf", `material_id` = 62;
INSERT INTO `motifs` SET `id` = 3, `name` = "Wood Elf", `material_id` = 63;
INSERT INTO `motifs` SET `id` = 4, `name` = "Nord", `material_id` = 64;
INSERT INTO `motifs` SET `id` = 5, `name` = "Breton", `material_id` = 65;
INSERT INTO `motifs` SET `id` = 6, `name` = "Redguard", `material_id` = 66;
INSERT INTO `motifs` SET `id` = 7, `name` = "Khajit", `material_id` = 67;
INSERT INTO `motifs` SET `id` = 8, `name` = "Orc", `material_id` = 68;
INSERT INTO `motifs` SET `id` = 9, `name` = "Argonian", `material_id` = 69;
INSERT INTO `motifs` SET `id` = 10, `name` = "Imperial", `material_id` = 70;
INSERT INTO `motifs` SET `id` = 11, `name` = "Ancient Elf", `material_id` = 71;
INSERT INTO `motifs` SET `id` = 12, `name` = "Barbaric", `material_id` = 72;
INSERT INTO `motifs` SET `id` = 13, `name` = "Primal", `material_id` = 73;
INSERT INTO `motifs` SET `id` = 14, `name` = "Daedric", `material_id` = 74;
INSERT INTO `motifs` SET `id` = 15, `name` = "Dwemer", `material_id` = 75;
INSERT INTO `motifs` SET `id` = 16, `name` = "Glass", `material_id` = 76;
INSERT INTO `motifs` SET `id` = 17, `name` = "Xivkyn", `material_id` = 77;
INSERT INTO `motifs` SET `id` = 18, `name` = "Akaviri", `material_id` = 78;
INSERT INTO `motifs` SET `id` = 19, `name` = "Mercenary", `material_id` = 79;
INSERT INTO `motifs` SET `id` = 20, `name` = "Yokudan", `material_id` = 80;
INSERT INTO `motifs` SET `id` = 21, `name` = "Ancient Orc", `material_id` = 81;
INSERT INTO `motifs` SET `id` = 22, `name` = "Trinimac", `material_id` = 82;
INSERT INTO `motifs` SET `id` = 23, `name` = "Malacath", `material_id` = 83;
INSERT INTO `motifs` SET `id` = 24, `name` = "Outlaw", `material_id` = 84;
INSERT INTO `motifs` SET `id` = 25, `name` = "Aldmeri Dominion", `material_id` = 85;
INSERT INTO `motifs` SET `id` = 26, `name` = "Daggerfall Covenant", `material_id` = 86;
INSERT INTO `motifs` SET `id` = 27, `name` = "Ebonheart Pact", `material_id` = 87;
INSERT INTO `motifs` SET `id` = 28, `name` = "Ra Gada", `material_id` = 88;
INSERT INTO `motifs` SET `id` = 29, `name` = "Soul Shriven", `material_id` = 89;
INSERT INTO `motifs` SET `id` = 30, `name` = "Morag Tong", `material_id` = 90;
INSERT INTO `motifs` SET `id` = 31, `name` = "Skinchanger", `material_id` = 91;
INSERT INTO `motifs` SET `id` = 32, `name` = "Abah's Watch", `material_id` = 92; -- '
INSERT INTO `motifs` SET `id` = 33, `name` = "Thieves Guild", `material_id` = 93;
INSERT INTO `motifs` SET `id` = 34, `name` = "Assassins League", `material_id` = 94;
INSERT INTO `motifs` SET `id` = 35, `name` = "Dro-m'Athra", `material_id` = 95; -- '
INSERT INTO `motifs` SET `id` = 36, `name` = "Dark Brotherhood", `material_id` = 96;
INSERT INTO `motifs` SET `id` = 37, `name` = "Ebony", `material_id` = 97;
INSERT INTO `motifs` SET `id` = 38, `name` = "Draugr", `material_id` = 98;
INSERT INTO `motifs` SET `id` = 39, `name` = "Minotaur", `material_id` = 99;
INSERT INTO `motifs` SET `id` = 40, `name` = "Order of the Hour", `material_id` = 100;
INSERT INTO `motifs` SET `id` = 41, `name` = "Celestial", `material_id` = 101;
INSERT INTO `motifs` SET `id` = 42, `name` = "Hollowjack", `material_id` = 102;
INSERT INTO `motifs` SET `id` = 43, `name` = "Grim Harlequin", `material_id` = 103;
INSERT INTO `motifs` SET `id` = 44, `name` = "Silken Ring", `material_id` = 104;
INSERT INTO `motifs` SET `id` = 45, `name` = "Mazzatun", `material_id` = 105;
INSERT INTO `motifs` SET `id` = 46, `name` = "Stalhrim Frostcaster", `material_id` = 106;
INSERT INTO `motifs` SET `id` = 47, `name` = "Buoyant Armiger", `material_id` = 107;
INSERT INTO `motifs` SET `id` = 48, `name` = "Ashlander", `material_id` = 108;
INSERT INTO `motifs` SET `id` = 49, `name` = "Militant Ordinator", `material_id` = 109;
INSERT INTO `motifs` SET `id` = 50, `name` = "Telvanni", `material_id` = 110;
INSERT INTO `motifs` SET `id` = 51, `name` = "Redoran", `material_id` = 111;
INSERT INTO `motifs` SET `id` = 52, `name` = "Hlaalu", `material_id` = 112;
INSERT INTO `motifs` SET `id` = 53, `name` = "Tsaesci", `material_id` = 113;
INSERT INTO `motifs` SET `id` = 54, `name` = "Bloodforge", `material_id` = 114;
INSERT INTO `motifs` SET `id` = 55, `name` = "Dreadhorn", `material_id` = 115;
INSERT INTO `motifs` SET `id` = 56, `name` = "Apostle", `material_id` = 116;
INSERT INTO `motifs` SET `id` = 57, `name` = "Ebonshadow", `material_id` = 116;
INSERT INTO `motifs` SET `id` = 58, `name` = "Fang Lair", `material_id` = 118;
INSERT INTO `motifs` SET `id` = 59, `name` = "Scalecaller", `material_id` = 119;
INSERT INTO `motifs` SET `id` = 60, `name` = "Worm Cult", `material_id` = 120;
INSERT INTO `motifs` SET `id` = 61, `name` = "Psijic Order", `material_id` = 121;
INSERT INTO `motifs` SET `id` = 62, `name` = "Sapiarch", `material_id` = 122;
INSERT INTO `motifs` SET `id` = 63, `name` = "Dremora", `material_id` = 123;
INSERT INTO `motifs` SET `id` = 64, `name` = "Pyandonean", `material_id` = 124;
INSERT INTO `motifs` SET `id` = 65, `name` = "Huntsman", `material_id` = 125;
INSERT INTO `motifs` SET `id` = 66, `name` = "Silver Dawn", `material_id` = 126;
INSERT INTO `motifs` SET `id` = 67, `name` = "Welkynar", `material_id` = 127;
INSERT INTO `motifs` SET `id` = 68, `name` = "Honor Guard", `material_id` = 128;
INSERT INTO `motifs` SET `id` = 69, `name` = "Dead-Water", `material_id` = 129;
INSERT INTO `motifs` SET `id` = 70, `name` = "Elder Argonian", `material_id` = 130;
INSERT INTO `motifs` SET `id` = 71, `name` = "Coldsnap Goblin", `material_id` = 131;
INSERT INTO `motifs` SET `id` = 72, `name` = "Meridian", `material_id` = 132;
INSERT INTO `motifs` SET `id` = 73, `name` = "Anequina", `material_id` = 133;
INSERT INTO `motifs` SET `id` = 74, `name` = "Pellitine", `material_id` = 134;
INSERT INTO `motifs` SET `id` = 75, `name` = "Sunspire", `material_id` = 135;
INSERT INTO `motifs` SET `id` = 76, `name` = "Dragonguard", `material_id` = 136;
INSERT INTO `motifs` SET `id` = 77, `name` = "Stags of Z'en", `material_id` = 137; -- '
INSERT INTO `motifs` SET `id` = 78, `name` = "Moongrave Fane", `material_id` = 138;
INSERT INTO `motifs` SET `id` = 79, `name` = "Refabricated", `material_id` = 139;
INSERT INTO `motifs` SET `id` = 80, `name` = "Shield of Senchal", `material_id` = 140;
INSERT INTO `motifs` SET `id` = 81, `name` = "New Moon Priest", `material_id` = 141;
INSERT INTO `motifs` SET `id` = 82, `name` = "Icereach Coven", `material_id` = 142;
INSERT INTO `motifs` SET `id` = 83, `name` = "Pyre Watch", `material_id` = 143;
INSERT INTO `motifs` SET `id` = 84, `name` = "Blackreach Vanguard", `material_id` = 144;
INSERT INTO `motifs` SET `id` = 85, `name` = "Greymoor", `material_id` = 145;
INSERT INTO `motifs` SET `id` = 86, `name` = "Sea Giant", `material_id` = 146;
INSERT INTO `motifs` SET `id` = 87, `name` = "Ancestral Nord", `material_id` = 147;
INSERT INTO `motifs` SET `id` = 88, `name` = "Ancestral Orc", `material_id` = 148;
INSERT INTO `motifs` SET `id` = 89, `name` = "Ancestral High Elf", `material_id` = 149;
INSERT INTO `motifs` SET `id` = 90, `name` = "Thorn Legion", `material_id` = 150;
INSERT INTO `motifs` SET `id` = 91, `name` = "Hazardous Alchemy", `material_id` = 151;
INSERT INTO `motifs` SET `id` = 92, `name` = "Ancestral Akaviri", `material_id` = 152;
INSERT INTO `motifs` SET `id` = 93, `name` = "Ancestral Breton", `material_id` = 153;
INSERT INTO `motifs` SET `id` = 94, `name` = "Ancestral Reach", `material_id` = 154;
INSERT INTO `motifs` SET `id` = 95, `name` = "Nighthollow", `material_id` = 155;
INSERT INTO `motifs` SET `id` = 96, `name` = "Arkthzand Armory", `material_id` = 156;
INSERT INTO `motifs` SET `id` = 97, `name` = "Wayward Guardian", `material_id` = 157;
INSERT INTO `motifs` SET `id` = 98, `name` = "House Hexos", `material_id` = 158;
INSERT INTO `motifs` SET `id` = 99, `name` = "Waking Flame", `material_id` = 159;
INSERT INTO `motifs` SET `id` = 100, `name` = "True-Sworn", `material_id` = 160;
INSERT INTO `motifs` SET `id` = 101, `name` = "Ivory Brigade", `material_id` = 161;
INSERT INTO `motifs` SET `id` = 102, `name` = "Sul-Xan", `material_id` = 162;
INSERT INTO `motifs` SET `id` = 103, `name` = "Black Fin Legion", `material_id` = 163;
INSERT INTO `motifs` SET `id` = 104, `name` = "Ancient Daedric", `material_id` = 164;
INSERT INTO `motifs` SET `id` = 105, `name` = "Crimson Oath", `material_id` = 165;
INSERT INTO `motifs` SET `id` = 106, `name` = "Silver Rose", `material_id` = 166;
INSERT INTO `motifs` SET `id` = 107, `name` = "Annihilarch's Chosen", `material_id` = 167; -- '
INSERT INTO `motifs` SET `id` = 108, `name` = "Fargrave Guardian", `material_id` = 168;
INSERT INTO `motifs` SET `id` = 109, `name` = "Dreadsails", `material_id` = 169;
INSERT INTO `motifs` SET `id` = 110, `name` = "Ascendant Order", `material_id` = 170;
INSERT INTO `motifs` SET `id` = 111, `name` = "Syrabanic Marine", `material_id` = 171;
INSERT INTO `motifs` SET `id` = 112, `name` = "Steadfast Society", `material_id` = 172;
INSERT INTO `motifs` SET `id` = 113, `name` = "Systres Guardian", `material_id` = 173;

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `sets`;
CREATE TABLE `sets` (
        `id`                    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`                  CHAR(32)        NOT NULL DEFAULT ""
) ENGINE InnoDB;

INSERT INTO `sets` SET `id` = 1, `name` = "Adept Rider";
INSERT INTO `sets` SET `id` = 2, `name` = "Aetherial Ascension";
INSERT INTO `sets` SET `id` = 3, `name` = "Alessia's Bulwark"; -- '
INSERT INTO `sets` SET `id` = 4, `name` = "Ancient Dragonguard";
INSERT INTO `sets` SET `id` = 5, `name` = "Armor Master";
INSERT INTO `sets` SET `id` = 6, `name` = "Armor of the Seducer";
INSERT INTO `sets` SET `id` = 7, `name` = "Ashen Grip";
INSERT INTO `sets` SET `id` = 8, `name` = "Assassin's Guile"; -- '
INSERT INTO `sets` SET `id` = 9, `name` = "Chimera's Rebuke"; -- '
INSERT INTO `sets` SET `id` = 10, `name` = "Claw of the Forest Wraith";
INSERT INTO `sets` SET `id` = 11, `name` = "Clever Alchemist";
INSERT INTO `sets` SET `id` = 12, `name` = "Coldharbour's Favorite"; -- '
INSERT INTO `sets` SET `id` = 13, `name` = "Critical Riposte";
INSERT INTO `sets` SET `id` = 14, `name` = "Daedric Trickery";
INSERT INTO `sets` SET `id` = 15, `name` = "Daring Corsair";
INSERT INTO `sets` SET `id` = 16, `name` = "Dauntless Combatant";
INSERT INTO `sets` SET `id` = 17, `name` = "Deadlands Demolisher";
INSERT INTO `sets` SET `id` = 18, `name` = "Death's Wind"; -- '
INSERT INTO `sets` SET `id` = 19, `name` = "Diamond's Victory"; -- '
INSERT INTO `sets` SET `id` = 20, `name` = "Dragon's Appetite"; -- '
INSERT INTO `sets` SET `id` = 21, `name` = "Druid's Braid"; -- '
INSERT INTO `sets` SET `id` = 22, `name` = "Eternal Hunt";
INSERT INTO `sets` SET `id` = 23, `name` = "Eyes of Mara";
INSERT INTO `sets` SET `id` = 24, `name` = "Fortified Brass";
INSERT INTO `sets` SET `id` = 25, `name` = "Grave-Stake Collector";
INSERT INTO `sets` SET `id` = 26, `name` = "Heartland Conqueror";
INSERT INTO `sets` SET `id` = 27, `name` = "Hist Bark";
INSERT INTO `sets` SET `id` = 28, `name` = "Hist Whisperer";
INSERT INTO `sets` SET `id` = 29, `name` = "Hunding's Rage"; -- '
INSERT INTO `sets` SET `id` = 30, `name` = "Innate Axiom";
INSERT INTO `sets` SET `id` = 31, `name` = "Iron Flask";
INSERT INTO `sets` SET `id` = 32, `name` = "Kagrenac's Hope"; -- '
INSERT INTO `sets` SET `id` = 33, `name` = "Kvatch Gladiator";
INSERT INTO `sets` SET `id` = 34, `name` = "Law of Julianos";
INSERT INTO `sets` SET `id` = 35, `name` = "Legacy of Karth";
INSERT INTO `sets` SET `id` = 36, `name` = "Magnus' Gift"; -- '
INSERT INTO `sets` SET `id` = 37, `name` = "Mechanical Acuity";
INSERT INTO `sets` SET `id` = 38, `name` = "Might of the Lost Legion";
INSERT INTO `sets` SET `id` = 39, `name` = "Morkuldin";
INSERT INTO `sets` SET `id` = 40, `name` = "Naga Shaman";
INSERT INTO `sets` SET `id` = 41, `name` = "New Moon Acolyte";
INSERT INTO `sets` SET `id` = 42, `name` = "Night Mother's Gaze"; -- '
INSERT INTO `sets` SET `id` = 43, `name` = "Night's Silence"; -- '
INSERT INTO `sets` SET `id` = 44, `name` = "Noble's Conquest"; -- '
INSERT INTO `sets` SET `id` = 45, `name` = "Nocturnal's Favor"; -- '
INSERT INTO `sets` SET `id` = 46, `name` = "Oblivion's Foe"; -- '
INSERT INTO `sets` SET `id` = 47, `name` = "Old Growth Brewer";
INSERT INTO `sets` SET `id` = 48, `name` = "Order's Wrath"; -- '
INSERT INTO `sets` SET `id` = 49, `name` = "Orgnum's Scales"; -- '
INSERT INTO `sets` SET `id` = 50, `name` = "Pelinal's Wrath"; -- '
INSERT INTO `sets` SET `id` = 51, `name` = "Red Eagle's Fury"; -- '
INSERT INTO `sets` SET `id` = 52, `name` = "Redistributor";
INSERT INTO `sets` SET `id` = 53, `name` = "Senche-Raht's Grit"; -- '
INSERT INTO `sets` SET `id` = 54, `name` = "Serpent's Disdain"; -- '
INSERT INTO `sets` SET `id` = 55, `name` = "Shacklebreaker";
INSERT INTO `sets` SET `id` = 56, `name` = "Shalidor's Curse"; -- '
INSERT INTO `sets` SET `id` = 57, `name` = "Sload's Semblance"; -- '
INSERT INTO `sets` SET `id` = 58, `name` = "Song of Lamae";
INSERT INTO `sets` SET `id` = 59, `name` = "Spectre's Eye"; -- '
INSERT INTO `sets` SET `id` = 60, `name` = "Spell Parasite";
INSERT INTO `sets` SET `id` = 61, `name` = "Stuhn's Favor"; -- '
INSERT INTO `sets` SET `id` = 62, `name` = "Tava's Favor"; -- '
INSERT INTO `sets` SET `id` = 63, `name` = "Torug's Pact"; -- '
INSERT INTO `sets` SET `id` = 64, `name` = "Trial by Fire";
INSERT INTO `sets` SET `id` = 65, `name` = "Twice-Born Star";
INSERT INTO `sets` SET `id` = 66, `name` = "Twilight's Embrace"; -- '
INSERT INTO `sets` SET `id` = 67, `name` = "Unchained Aggressor";
INSERT INTO `sets` SET `id` = 68, `name` = "Vampire's Kiss"; -- '
INSERT INTO `sets` SET `id` = 69, `name` = "Varen's Legacy"; -- '
INSERT INTO `sets` SET `id` = 70, `name` = "Vastarie's Tutelage"; -- '
INSERT INTO `sets` SET `id` = 71, `name` = "Way of the Arena";
INSERT INTO `sets` SET `id` = 72, `name` = "Whitestrake's Retribution"; -- '
INSERT INTO `sets` SET `id` = 73, `name` = "Willow's Path"; -- '
INSERT INTO `sets` SET `id` = 74, `name` = "Wretched Vitality";

-- -----------------------------------------------------------------------------

SET foreign_key_checks = 1;

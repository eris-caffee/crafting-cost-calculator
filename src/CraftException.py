class CraftException( Exception ):
    msg = None

    def __init__( self, msg ):
        self.msg = msg

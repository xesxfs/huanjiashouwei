package
{
   import flash.geom.Point;
   
   public class PowerPointerFarmer extends §_-Tm§
   {
       
      
      public function PowerPointerFarmer(param1:Level, param2:§_-5g§)
      {
         addFrameScript(0,this.frame1);
         super(param1,param2);
         this.cRoot.setPowerPointer(this);
      }
      
      override public function canFirePower() : Boolean
      {
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.cRoot.paths.length)
         {
            _loc3_ = 0;
            while(_loc3_ < this.cRoot.paths[_loc1_][0].length)
            {
               if(!this.cRoot.hasTunnels || !this.onTunnel(_loc1_,_loc3_))
               {
                  if(Math.sqrt(Math.pow(this.cRoot.paths[_loc1_][0][_loc3_].y - this.y,2) + Math.pow(this.cRoot.paths[_loc1_][0][_loc3_].x - this.x,2)) < 30)
                  {
                     return true;
                  }
               }
               _loc3_++;
            }
            _loc1_++;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.cRoot.staticAreas.length)
         {
            if(this.cRoot.onRangeStaticArea(this.cRoot.staticAreas[_loc2_],new Point(this.x,this.y)))
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      override public function createPower() : void
      {
         this.cRoot.entities.addChild(this.getRandomFarmer(7,7));
         this.cRoot.entities.addChild(this.getRandomFarmer(-7,-7));
         if(this.cRoot.game.pc && this.cRoot.game.pcExtraReinforcement)
         {
            this.cRoot.entities.addChild(this.getRandomFarmer(-7,14));
         }
         this.cRoot.game.gameSounds.playReinforcementTaunt();
      }
      
      private function getRandomFarmer(param1:int, param2:int) : Soldier
      {
         var _loc3_:Number = Math.random();
         if(_loc3_ < 0.33)
         {
            return new §_-TE§(new Point(this.x + param1,this.y + param2),new Point(this.x + param1,this.y + param2),null,new Point(this.x,this.y));
         }
         if(_loc3_ >= 0.33 && _loc3_ <= 0.66)
         {
            return new §_-Fh§(new Point(this.x + param1,this.y + param2),new Point(this.x + param1,this.y + param2),null,new Point(this.x,this.y));
         }
         return new §_-R3§(new Point(this.x + param1,this.y + param2),new Point(this.x + param1,this.y + param2),null,new Point(this.x,this.y));
      }
      
      private function onTunnel(param1:*, param2:*) : Boolean
      {
         if(this.cRoot.tunnels[param1][0])
         {
            if(param2 >= this.cRoot.tunnels[param1][1] && param2 <= this.cRoot.tunnels[param1][4])
            {
               return true;
            }
         }
         return false;
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}

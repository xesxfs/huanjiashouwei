package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-9c§ extends MovieClip
   {
       
      
      protected var errorTime:int;
      
      protected var errorTimeCounter:int;
      
      protected var §_-3W§:§_-2A§;
      
      protected var cRoot:Level;
      
      public function §_-9c§(param1:Level, param2:§_-2A§)
      {
         super();
         addFrameScript(0,this.frame1);
         this.errorTime = 10;
         this.errorTimeCounter = 0;
         this.§_-3W§ = param2;
         this.cRoot = param1;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.x = stage.mouseX;
         this.y = stage.mouseY;
         this.stage.focus = this.stage;
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.freeRally,false,0,true);
      }
      
      public function freeRally(param1:MouseEvent) : void
      {
         if(!this.§_-HQ§())
         {
            this.gotoAndStop("error");
            this.errorTimeCounter = 1;
            return;
         }
         this.§_-3W§.portrait.setNormal();
         this.§_-3W§.changeRallyPoint(new Point(this.x,this.y));
         this.cRoot.menu.forceHideInfo();
         this.cRoot.§_-Fe§();
         this.cRoot.decals.addChild(new TowerRallyFlag(new Point(this.x,this.y)));
         this.cRoot.game.gameSounds.§_-4l§();
         this.cRoot.game.gameAchievement.changeRallyPoint(this.cRoot);
         this.destroyThis();
      }
      
      public function cancelRallyPoint() : void
      {
         this.§_-3W§.portrait.setNormal();
         this.cRoot.menu.forceHideInfo();
         this.cRoot.§_-Fe§();
         this.destroyThis();
      }
      
      public function §_-HQ§() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.cRoot.paths.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.cRoot.paths[_loc1_][0].length)
            {
               if(!this.cRoot.hasTunnels || !this.onTunnel(_loc1_,_loc2_))
               {
                  if(Math.sqrt(Math.pow(this.cRoot.paths[_loc1_][0][_loc2_].y - this.y,2) + Math.pow(this.cRoot.paths[_loc1_][0][_loc2_].x - this.x,2)) < 30)
                  {
                     return true;
                  }
               }
               _loc2_++;
            }
            _loc1_++;
         }
         return false;
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
      
      public function onFrameUpdate() : void
      {
         if(this.errorTimeCounter != 0)
         {
            if(this.errorTimeCounter < this.errorTime)
            {
               this.errorTimeCounter++;
            }
            else
            {
               this.gotoAndStop("normal");
               this.errorTimeCounter = 0;
            }
         }
         this.x = stage.mouseX;
         this.y = stage.mouseY;
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         this.play();
      }
      
      public function destroyThis() : void
      {
         this.cRoot.heroRallyPoint = null;
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.freeRally);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}

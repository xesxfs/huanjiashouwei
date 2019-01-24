package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class TowerRallyPoint extends MovieClip
   {
       
      
      protected var errorTime:int;
      
      protected var errorTimeCounter:int;
      
      protected var §_-35§:Boolean;
      
      protected var §_-Nf§:int;
      
      protected var forceRangeMargin:int;
      
      protected var tower:Tower;
      
      protected var cRoot:Level;
      
      public function TowerRallyPoint(param1:Level, param2:Tower, param3:Boolean = false, param4:int = 0, param5:int = 0)
      {
         super();
         addFrameScript(0,this.frame1);
         this.errorTime = 10;
         this.errorTimeCounter = 0;
         this.§_-35§ = param3;
         this.§_-Nf§ = param4;
         this.forceRangeMargin = param5;
         this.tower = param2;
         this.cRoot = param1;
         this.cRoot.rallyPoint = this;
         if(!this.§_-35§)
         {
            §_-Go§(this.tower).§finally§();
         }
         else
         {
            TowerMageSorcerer(this.tower).§_-Fp§();
         }
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
         if(!this.§_-35§)
         {
            §_-Go§(this.tower).§_-4A§();
         }
         else
         {
            TowerMageSorcerer(this.tower).§_-4A§();
         }
         this.cRoot.menu.forceHideInfo();
         this.cRoot.§_-Fe§();
         this.cRoot.rallyPoint = null;
         this.cRoot.decals.addChild(new TowerRallyFlag(new Point(this.x,this.y)));
         this.cRoot.game.gameSounds.§_-4l§();
         if(!this.§_-35§)
         {
            §_-Go§(this.tower).gotoIdle(new Point(this.x,this.y));
         }
         else
         {
            TowerMageSorcerer(this.tower).gotoIdle(new Point(this.x,this.y));
         }
         this.cRoot.game.gameAchievement.changeRallyPoint(this.cRoot);
         this.destroyThis();
      }
      
      public function cancelRallyPoint() : void
      {
         if(!this.§_-35§)
         {
            §_-Go§(this.tower).§_-4A§();
         }
         else
         {
            TowerMageSorcerer(this.tower).§_-4A§();
         }
         this.cRoot.rallyPoint = null;
         this.cRoot.menu.forceHideInfo();
         this.cRoot.§_-Fe§();
         this.destroyThis();
      }
      
      public function §_-HQ§() : Boolean
      {
         var _loc2_:int = 0;
         if(!this.onRange())
         {
            return false;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.cRoot.paths.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.cRoot.paths[_loc1_][0].length)
            {
               if(Math.sqrt(Math.pow(this.cRoot.paths[_loc1_][0][_loc2_].y - this.y,2) + Math.pow(this.cRoot.paths[_loc1_][0][_loc2_].x - this.x,2)) < 30)
               {
                  return true;
               }
               _loc2_++;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function onRange() : Boolean
      {
         var _loc1_:Ellipse = null;
         if(this.§_-Nf§ == 0)
         {
            if(!this.§_-35§)
            {
               _loc1_ = new Ellipse(this.tower.x - this.cRoot.gameSettings.soldiers.level1.rangeRally / 2,this.tower.y - 10 - this.cRoot.gameSettings.soldiers.level1.rangeRally * this.cRoot.gameSettings.rangeRatio / 2,this.cRoot.gameSettings.soldiers.level1.rangeRally,this.cRoot.gameSettings.soldiers.level1.rangeRally * this.cRoot.gameSettings.rangeRatio);
               return _loc1_.containsPoint(new Point(this.x,this.y));
            }
            _loc1_ = new Ellipse(this.tower.x - this.cRoot.gameSettings.mages.sorcerer.elementalRallyRange / 2,this.tower.y - 10 - this.cRoot.gameSettings.mages.sorcerer.elementalRallyRange * this.cRoot.gameSettings.rangeRatio / 2,this.cRoot.gameSettings.mages.sorcerer.elementalRallyRange,this.cRoot.gameSettings.mages.sorcerer.elementalRallyRange * this.cRoot.gameSettings.rangeRatio);
            return _loc1_.containsPoint(new Point(this.x,this.y));
         }
         _loc1_ = new Ellipse(this.tower.x - this.§_-Nf§ / 2,this.tower.y + this.forceRangeMargin - this.§_-Nf§ * this.cRoot.gameSettings.rangeRatio / 2,this.§_-Nf§,this.§_-Nf§ * this.cRoot.gameSettings.rangeRatio);
         return _loc1_.containsPoint(new Point(this.x,this.y));
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

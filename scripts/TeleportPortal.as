package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class TeleportPortal extends MovieClip
   {
       
      
      public var isActive:Boolean;
      
      public var isOpen:Boolean;
      
      public var maxEnemies:int;
      
      public var teleportedEnemies:int;
      
      public var teleportingNodes:int;
      
      public var openTime:int;
      
      public var openTimeCounter:int;
      
      public var rangeHeight:int;
      
      public var rangeWidth:int;
      
      public var fadeInTime:int = 5;
      
      public var fadeInTimeCounter:int;
      
      public var fadeOutTime:int = 25;
      
      public var fadeOutTimeCounter:int;
      
      public var sName:String;
      
      public var cRoot:Level;
      
      public function TeleportPortal(param1:Point, param2:int, param3:int, param4:int)
      {
         super();
         addFrameScript(24,this.frame25);
         this.isActive = false;
         this.x = param1.x;
         this.y = param1.y;
         this.openTime = 10;
         this.isOpen = true;
         this.maxEnemies = param2;
         this.teleportingNodes = param4;
         this.rangeHeight = 35;
         this.rangeWidth = 50;
         this.sName = Math.random().toString();
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playArcaneTeleportAttack(this.sName);
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            if(this.fadeInTimeCounter < this.fadeInTime)
            {
               this.fadeInTimeCounter++;
               return;
            }
            this.isActive = true;
         }
         if(this.openTimeCounter >= this.openTime)
         {
            if(this.fadeOutTimeCounter < this.fadeOutTime)
            {
               this.fadeOutTimeCounter++;
               return;
            }
            this.destroyThis();
            return;
         }
         this.openTimeCounter++;
         if(this.isOpen)
         {
            this.teleportEnemies();
         }
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "teleportEnd")
         {
            this.play();
         }
      }
      
      public function teleportEnemies() : void
      {
         var _loc1_:Enemy = null;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && !_loc1_.isBoss && _loc1_.§_-3Y§ && this.onRange(_loc1_))
            {
               MovieClip(_loc1_).teleportMe(this.teleportingNodes + this.getRandom(-3,6));
               this.teleportedEnemies = this.teleportedEnemies + 1;
               this.cRoot.game.gameAchievement.§_-Ky§(this.cRoot);
               if(this.teleportedEnemies == this.maxEnemies)
               {
                  this.isOpen = false;
                  break;
               }
            }
         }
      }
      
      public function onRange(param1:Object) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.rangeWidth / 2,this.y - this.rangeHeight / 2,this.rangeWidth,this.rangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      public function destroyThis() : void
      {
         this.cRoot.game.gameSounds.removeSound(this.sName);
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame25() : *
      {
         stop();
      }
   }
}

package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class BoltNecromancer extends MovieClip
   {
       
      
      protected var isActive:Boolean = true;
      
      protected var target:Soldier;
      
      protected var §_-J7§:int = 10;
      
      protected var §_-Rn§:int = 0;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var aceleration:Number = 1;
      
      protected var maxAceleration:Number;
      
      protected var §_-0m§:Number;
      
      protected var §_-KM§:Number;
      
      protected var minDamage:int;
      
      protected var maxDamage:int;
      
      protected var cRoot:Level;
      
      public function BoltNecromancer(param1:Point, param2:Soldier, param3:Point = null)
      {
         super();
         addFrameScript(1,this.frame2,10,this.frame11);
         this.x = param1.x;
         this.y = param1.y;
         this.target = param2;
         if(param3 != null)
         {
            this.§_-0m§ = param3.x;
            this.§_-KM§ = param3.y;
         }
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            this.fadeThis();
            return;
         }
         this.moveMe(false);
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrame)
         {
            case "travelEnd":
               this.gotoAndPlay("travel");
               break;
            case "hitEnd":
               break;
            default:
               this.play();
         }
      }
      
      protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playSorcererBolt();
         this.maxAceleration = 15;
         this.setLevelSettings();
         this.moveMe(true);
      }
      
      protected function setLevelSettings() : void
      {
         this.minDamage = this.cRoot.gameSettings.enemies.necromancer.spellMinDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.necromancer.spellMaxDamage;
      }
      
      protected function moveMe(param1:Boolean) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         if(this.target != null)
         {
            if(this.target.parent == null || !this.target.isActive)
            {
               this.target = null;
            }
         }
         if(this.target != null)
         {
            _loc2_ = this.target.y - 7 - this.y;
            _loc3_ = this.target.x - this.x;
            this.§_-KM§ = this.target.y - 7;
            this.§_-0m§ = this.target.x;
         }
         else
         {
            _loc2_ = this.§_-KM§ - this.y;
            _loc3_ = this.§_-0m§ - this.x;
         }
         _loc4_ = Math.atan2(_loc2_,_loc3_);
         if(this.aceleration < this.maxAceleration)
         {
            this.aceleration = this.aceleration + Math.ceil(this.aceleration * 0.05);
            if(this.aceleration >= this.maxAceleration)
            {
               this.aceleration = this.maxAceleration;
            }
         }
         this.§_-IR§ = Math.sin(_loc4_) * this.aceleration;
         this.§_-Jy§ = Math.cos(_loc4_) * this.aceleration;
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
         this.x = this.x + this.§_-Jy§;
         this.y = this.y + this.§_-IR§;
         if(Math.sqrt(Math.pow(this.§_-KM§ - this.y,2) + Math.pow(this.§_-0m§ - this.x,2)) < this.aceleration)
         {
            if(this.target != null)
            {
               this.hitOnTarget();
            }
            else
            {
               this.hit();
            }
         }
      }
      
      protected function hitOnTarget() : void
      {
         this.target.setDamage(this.getDamage(),false);
         this.hit();
      }
      
      protected function hit() : void
      {
         this.isActive = false;
         this.x = this.§_-0m§;
         this.y = this.§_-KM§;
         this.aceleration = 0;
         this.gotoAndPlay("hit");
      }
      
      protected function getDamage() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      protected function fadeThis() : void
      {
         if(this.§_-Rn§ == this.§_-J7§)
         {
            this.destroyThis();
         }
         this.§_-Rn§++;
      }
      
      protected function destroyThis() : void
      {
         this.target = null;
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame2() : *
      {
         gotoAndPlay("travel");
      }
      
      function frame11() : *
      {
         stop();
      }
   }
}

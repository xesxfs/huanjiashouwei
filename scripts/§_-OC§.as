package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   
   public class §_-OC§ extends MovieClip
   {
       
      
      public var level:int;
      
      public var isActive:Boolean = true;
      
      public var target:Enemy;
      
      public var minDamage:int;
      
      public var maxDamage:int;
      
      public var §_-J7§:int = 11;
      
      public var §_-Rn§:int = 0;
      
      public var §_-Jy§:Number;
      
      public var §_-IR§:Number;
      
      public var §_-66§:Number = 20;
      
      public var §_-6v§:Number;
      
      public var §_-5M§:Number;
      
      public var §_-FC§:Number;
      
      public var §_-Qu§:Number;
      
      public var §_-T§:Number;
      
      public var §_-JI§:Number;
      
      public var §_-6k§:Number;
      
      public var §_-4W§:Number;
      
      public var §_-0c§:Number;
      
      public var t0:Number;
      
      public var t1:Number;
      
      public var g:Number = 1;
      
      public var cRoot:Level;
      
      public function §_-OC§(param1:Point, param2:int, param3:Enemy, param4:Point = null, param5:int = 0, param6:int = 0)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.target = param3;
         this.level = param2;
         this.minDamage = param6;
         this.maxDamage = param6;
         this.t0 = 0;
         this.t1 = 15;
         if(param5 != 0)
         {
            this.t1 = param5;
         }
         if(this.target == null)
         {
            this.§_-6v§ = param4.x;
            this.§_-5M§ = param4.y;
         }
         else if(this.target.§_-4Y§)
         {
            this.§_-6v§ = this.target.x + this.target.xAdjust;
            this.§_-5M§ = this.target.y + this.target.yAdjust;
         }
         else
         {
            this.§_-6v§ = this.target.x + this.target.xAdjust + this.target.§_-Jy§ * this.t1 + Math.random() * 10;
            this.§_-5M§ = this.target.y + this.target.yAdjust + this.target.§_-IR§ * this.t1 + Math.random() * 10 - 10;
         }
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playAxeSound();
         this.§_-FC§ = this.x;
         this.§_-Qu§ = this.y;
         this.§_-Jy§ = (this.§_-6v§ - this.§_-FC§) / this.t1;
         this.§_-IR§ = (this.§_-5M§ - this.§_-Qu§ - this.g * this.t1 * (this.t1 / 2)) / this.t1;
         this.setLevelSettings();
      }
      
      public function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      public function onFrameUpdate() : void
      {
         var _loc1_:Class = null;
         if(!this.isActive)
         {
            this.fadeThis();
            return;
         }
         this.moveStuff();
         if(this.target != null && this.target.isActive)
         {
            if(this.t0 + 1 >= this.t1 && this.hitTestObject(this.target))
            {
               this.x = this.target.x + this.target.xAdjust;
               this.y = this.target.y + this.target.yAdjust;
               if(this.target.§_-2y§)
               {
                  _loc1_ = getDefinitionByName(this.target.§_-4q§) as Class;
                  this.cRoot.bullets.addChild(new _loc1_(new Point(this.x,this.y),this.rotation,this.cRoot));
               }
               this.target.setDamage(this.getDamage(),this.cRoot.gameSettings.P_ARMOR);
               this.destroyThis();
               this.isActive = false;
               return;
            }
         }
         if(this.t0 == this.t1)
         {
            this.§_-NM§();
            this.isActive = false;
            return;
         }
         this.t0++;
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      private function getDamage() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      private function setLevelSettings() : void
      {
      }
      
      private function §_-NM§() : void
      {
         this.cRoot.decals.addChild(new BulletSmoke(new Point(this.§_-6v§,this.§_-5M§)));
         this.destroyThis();
      }
      
      private function moveStuff() : void
      {
         this.x = this.§_-FC§ + this.t0 * this.§_-Jy§;
         this.y = this.§_-Qu§ + this.t0 * this.§_-IR§ + this.g * this.t0 * this.t0 / 2;
         this.t0++;
         this.§_-T§ = this.§_-Qu§ + this.t0 * this.§_-IR§ + this.g * this.t0 * this.t0 / 2;
         this.§_-JI§ = this.§_-FC§ + this.t0 * this.§_-Jy§;
         this.t0--;
         this.§_-6k§ = this.§_-T§ - this.y;
         this.§_-4W§ = this.§_-JI§ - this.x;
         this.§_-0c§ = Math.atan2(this.§_-6k§,this.§_-4W§);
         this.rotation = 180 - Math.atan2(-Math.sin(this.§_-0c§) * this.§_-66§,Math.cos(this.§_-0c§) * this.§_-66§) * 180 / Math.PI;
      }
      
      private function fadeThis() : void
      {
         if(this.§_-Rn§ == this.§_-J7§)
         {
            this.destroyThis();
         }
         this.§_-Rn§++;
      }
      
      private function destroyThis() : void
      {
         this.target = null;
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}

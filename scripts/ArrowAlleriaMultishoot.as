package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   
   public class ArrowAlleriaMultishoot extends MovieClip
   {
       
      
      public var level:int;
      
      public var isActive:Boolean = true;
      
      public var doubleDamage:Boolean;
      
      public var §_-54§:int;
      
      public var target:Enemy;
      
      public var minDamage:int;
      
      public var maxDamage:int;
      
      public var debuff:§_-27§;
      
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
      
      public function ArrowAlleriaMultishoot(param1:int, param2:Enemy, param3:Point = null, param4:§_-27§ = null, param5:int = 0, param6:Boolean = false, param7:int = 0, param8:int = 0)
      {
         super();
         addFrameScript(0,this.frame1);
         this.target = param2;
         this.level = param1;
         this.debuff = param4;
         this.doubleDamage = param6;
         this.§_-54§ = param7;
         this.minDamage = param8;
         this.maxDamage = param8;
         this.t0 = 0;
         this.t1 = 17;
         if(param5 != 0)
         {
            this.t1 = param5;
         }
         if(this.target == null)
         {
            this.§_-6v§ = param3.x;
            this.§_-5M§ = param3.y;
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
         this.cRoot.game.gameSounds.§_-PK§();
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
         this.moveArrow();
         if(this.target != null && this.target.isActive)
         {
            if(this.t0 + 2 >= this.t1 && this.hitTestObject(this.target))
            {
               this.x = this.target.x + this.target.xAdjust;
               this.y = this.target.y + this.target.yAdjust;
               if(this.target.§_-2y§)
               {
                  _loc1_ = getDefinitionByName(this.target.§_-4q§) as Class;
                  this.cRoot.bullets.addChild(new _loc1_(new Point(this.x,this.y),this.rotation,this.cRoot));
               }
               this.target.setDamage(this.getDamage(),this.cRoot.gameSettings.P_ARMOR,this.debuff,this.§_-54§);
               if(this.doubleDamage)
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"crit"));
               }
               else if(this.target != null && this.target.isDead)
               {
                  if(Math.random() > 0.5)
                  {
                     this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"oof"));
                  }
                  else
                  {
                     this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"shunt"));
                  }
               }
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
         var _loc1_:int = this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
         if(this.doubleDamage)
         {
            return _loc1_ * 2;
         }
         return _loc1_;
      }
      
      private function setLevelSettings() : void
      {
      }
      
      private function §_-NM§() : void
      {
         this.cRoot.decals.addChild(new ArrowDecal(new Point(this.x,this.y)));
         this.destroyThis();
      }
      
      private function moveArrow() : void
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
         this.cRoot.bullets.addChild(new §_-46§(new Point(this.x,this.y),this.rotation));
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
         this.debuff = null;
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}

package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ArrowEnemy extends MovieClip
   {
       
      
      public var isActive:Boolean = true;
      
      public var target:Soldier;
      
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
      
      public function ArrowEnemy(param1:Soldier, param2:Point = null)
      {
         super();
         addFrameScript(0,this.frame1,11,this.frame12);
         this.target = param1;
         this.t0 = 0;
         this.t1 = 17;
         if(param2 != null)
         {
            this.§_-6v§ = param2.x;
            this.§_-5M§ = param2.y;
         }
         else
         {
            this.§_-6v§ = this.target.x;
            this.§_-5M§ = this.target.y - 7;
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
      
      public function onFrameUpdate() : void
      {
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
               this.x = this.target.x;
               this.y = this.target.y - 7;
               if(Math.random() < 0.3)
               {
                  this.cRoot.bullets.addChild(new Pop(new Point(this.target.x,this.target.y),"oof"));
               }
               this.target.setDamage(this.getDamage(),false);
               this.gotoAndPlay("hit");
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
         this.minDamage = this.cRoot.gameSettings.enemies.shadowArcher.arrowMinDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.shadowArcher.arrowMaxDamage;
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
      
      function frame1() : *
      {
         stop();
      }
      
      function frame12() : *
      {
         stop();
      }
   }
}

package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class BombZapper extends MovieClip
   {
       
      
      public var isActive:Boolean = true;
      
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
      
      public var size:int;
      
      public var §_-96§:Ellipse;
      
      public var cRoot:Level;
      
      public function BombZapper(param1:Point, param2:Point)
      {
         super();
         addFrameScript(0,this.frame1,19,this.frame20);
         this.x = param1.x;
         this.y = param1.y;
         this.t0 = 0;
         this.t1 = 19;
         this.§_-6v§ = param2.x;
         this.§_-5M§ = param2.y;
         this.size = 40;
         this.§_-96§ = new Ellipse(this.§_-6v§ - this.size * 1.5 / 2,this.§_-5M§ - this.size / 2,this.size * 1.5,this.size);
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
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            this.fadeThis();
            return;
         }
         this.moveBomb();
         if(this.t0 == this.t1)
         {
            this.hit();
            return;
         }
         this.t0++;
      }
      
      public function pause() : void
      {
         if(this.currentFrameLabel != "idle" && this.currentFrameLabel != "hitEnd")
         {
            this.stop();
         }
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "idle" && this.currentFrameLabel != "hitEnd")
         {
            this.play();
         }
      }
      
      private function setLevelSettings() : void
      {
         this.minDamage = this.cRoot.gameSettings.enemies.goblinZapper.bombMinDamage;
         this.maxDamage = this.cRoot.gameSettings.enemies.goblinZapper.bombMaxDamage;
      }
      
      private function hit() : void
      {
         var _loc1_:Soldier = null;
         this.rotation = 0;
         this.cRoot.game.gameSounds.playBombSound();
         for each(_loc1_ in this.cRoot.soldiers)
         {
            if(_loc1_.isActive && this.onRange(_loc1_))
            {
               _loc1_.setDamage(this.getDamage(_loc1_),false);
            }
         }
         this.isActive = false;
         this.cRoot.addToDecal(new BombDecal(new Point(this.x,this.y)));
         if(Math.random() > 0.5)
         {
            this.cRoot.bullets.addChild(new Pop(new Point(this.x,this.y),"kboom"));
         }
         this.gotoAndPlay("hit");
      }
      
      private function moveBomb() : void
      {
         this.x = this.§_-FC§ + this.t0 * this.§_-Jy§;
         this.y = this.§_-Qu§ + this.t0 * this.§_-IR§ + this.g * this.t0 * this.t0 / 2;
         this.rotation = this.rotation + 20;
      }
      
      protected function getDamage(param1:Soldier) : int
      {
         var _loc2_:Number = Math.atan2(param1.x - this.§_-6v§,param1.y - this.§_-5M§) * 180 / Math.PI;
         var _loc3_:Point = this.getDestinationPoint(_loc2_);
         var _loc4_:Number = Math.sqrt((_loc3_.x - this.§_-6v§) * (_loc3_.x - this.§_-6v§) + (_loc3_.y - this.§_-5M§) * (_loc3_.y - this.§_-5M§));
         var _loc5_:Number = Math.sqrt((param1.x - this.§_-6v§) * (param1.x - this.§_-6v§) + (param1.y - this.y) * (param1.y - this.y));
         var _loc6_:Number = this.maxDamage - this.minDamage;
         var _loc7_:int = _loc6_ - _loc5_ * _loc6_ / _loc4_ + this.minDamage;
         return _loc7_;
      }
      
      protected function onRange(param1:Soldier) : Boolean
      {
         return this.§_-96§.containsPoint(new Point(param1.x,param1.y));
      }
      
      protected function getDestinationPoint(param1:int) : Point
      {
         return this.§_-96§.getPointOfDegree(param1);
      }
      
      protected function fadeThis() : void
      {
         if(this.§_-Rn§ == this.§_-J7§)
         {
            this.destroyThis();
         }
         this.§_-Rn§++;
      }
      
      private function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame20() : *
      {
         stop();
      }
   }
}

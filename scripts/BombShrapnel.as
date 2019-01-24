package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class BombShrapnel extends Bomb
   {
       
      
      public function BombShrapnel(param1:int, param2:Point, param3:Point)
      {
         addFrameScript(0,this.frame1,21,this.frame22);
         super(param1,param2,param3,3);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.alpha = 0;
         this.g = 0;
         this.t0 = 0;
         this.t1 = Math.ceil(Math.random() * 4 + 4);
         this.§_-Fi§ = this.cRoot.gameSettings.archers.musketeer.shrapnelArea;
         this.§_-96§ = new Ellipse(this.§_-6v§ - this.§_-Fi§ * 1.5 / 2,this.§_-5M§ - this.§_-Fi§ / 2,this.§_-Fi§ * 1.5,this.§_-Fi§);
         this.minDamage = this.cRoot.gameSettings.archers.musketeer.shrapnelMinDamage * this.level;
         this.maxDamage = this.cRoot.gameSettings.archers.musketeer.shrapnelMaxDamage * this.level;
         this.§_-Jy§ = (this.§_-6v§ - this.§_-FC§) / this.t1;
         this.§_-IR§ = (this.§_-5M§ - this.§_-Qu§ - this.g * this.t1 * this.t1 / 2) / this.t1;
         this.rotation = Math.random() * 100;
      }
      
      override protected function hit() : void
      {
         var _loc1_:MovieClip = null;
         this.rotation = 0;
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && this.onRange(Enemy(_loc1_)))
            {
               _loc1_.bombHit(this.getDamage(_loc1_));
            }
         }
         this.isActive = false;
         this.cRoot.addToDecal(new BombDecal(new Point(this.x,this.y)));
         this.playPop();
         this.gotoAndPlay("hit");
      }
      
      override protected function getDamage(param1:*) : int
      {
         var _loc2_:Number = Math.atan2(param1.x - this.§_-6v§,param1.y - this.§_-5M§) * 180 / Math.PI;
         var _loc3_:Point = this.getDestinationPoint(_loc2_);
         var _loc4_:Number = Math.sqrt((_loc3_.x - this.§_-6v§) * (_loc3_.x - this.§_-6v§) + (_loc3_.y - this.§_-5M§) * (_loc3_.y - this.§_-5M§));
         var _loc5_:Number = Math.sqrt((param1.x - this.§_-6v§) * (param1.x - this.§_-6v§) + (param1.y - this.y) * (param1.y - this.y));
         var _loc6_:Number = this.maxDamage - this.minDamage;
         var _loc7_:int = _loc6_ - _loc5_ * _loc6_ / _loc4_ + this.minDamage;
         return _loc7_;
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame22() : *
      {
         stop();
      }
   }
}

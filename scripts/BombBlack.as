package
{
   import flash.events.Event;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class BombBlack extends Bomb
   {
       
      
      public function BombBlack(param1:int, param2:Point, param3:Point)
      {
         addFrameScript(0,this.frame1,21,this.frame22);
         super(param1,param2,param3);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playBombShootSound();
         this.t0 = 0;
         this.t1 = 27;
         this.setLevelSettings();
         this.§_-96§ = new Ellipse(this.§_-6v§ - this.§_-Fi§ * 1.5 / 2,this.§_-5M§ - this.§_-Fi§ / 2,this.§_-Fi§ * 1.5,this.§_-Fi§);
         this.§_-Jy§ = (this.§_-6v§ - this.§_-FC§) / this.t1;
         this.§_-IR§ = (this.§_-5M§ - this.§_-Qu§ - this.g * this.t1 * this.t1 / 2) / this.t1;
         this.rotation = Math.random() * 100;
      }
      
      override protected function playPop() : void
      {
         if(Math.random() > 0.5)
         {
            this.cRoot.bullets.addChild(new Pop(new Point(this.x,this.y),"kboom"));
         }
      }
      
      override protected function rotateBomb() : void
      {
         var _loc1_:int = this.t0 + 1;
         var _loc2_:Number = this.§_-FC§ + _loc1_ * this.§_-Jy§;
         var _loc3_:Number = this.§_-Qu§ + _loc1_ * this.§_-IR§ + g * _loc1_ * _loc1_ / 2;
         var _loc4_:Number = _loc2_ - this.x;
         var _loc5_:Number = _loc3_ - this.y;
         var _loc6_:Number = Math.atan2(_loc5_,_loc4_);
         this.rotation = 450 - Math.atan2(-Math.sin(_loc6_),Math.cos(_loc6_)) * 180 / Math.PI;
      }
      
      private function setLevelSettings() : void
      {
         this.§_-Fi§ = this.cRoot.gameSettings.engineers.level3.area;
         this.minDamage = this.cRoot.gameSettings.engineers.level3.minDamage;
         this.maxDamage = this.cRoot.gameSettings.engineers.level3.maxDamage;
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

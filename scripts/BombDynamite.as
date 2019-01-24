package
{
   import flash.events.Event;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class BombDynamite extends Bomb
   {
       
      
      public function BombDynamite(param1:int, param2:Point, param3:Point)
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
      
      private function setLevelSettings() : void
      {
         this.§_-Fi§ = this.cRoot.gameSettings.engineers.level2.area;
         this.minDamage = this.cRoot.gameSettings.engineers.level2.minDamage;
         this.maxDamage = this.cRoot.gameSettings.engineers.level2.maxDamage;
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

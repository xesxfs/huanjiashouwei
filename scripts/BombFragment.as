package
{
   import flash.events.Event;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class BombFragment extends Bomb
   {
       
      
      public function BombFragment(param1:int, param2:Point, param3:Point, param4:int)
      {
         addFrameScript(0,this.frame1,19,this.frame20);
         super(param1,param2,param3);
         this.t1 = param4;
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameAchievement.clusterFire(this.cRoot);
         this.t0 = 0;
         this.setLevelSettings();
         this.§_-96§ = new Ellipse(this.§_-6v§ - this.§_-Fi§ * 1.5 / 2,this.§_-5M§ - this.§_-Fi§ / 2,this.§_-Fi§ * 1.5,this.§_-Fi§);
         this.§_-Jy§ = (this.§_-6v§ - this.§_-FC§) / this.t1;
         this.§_-IR§ = (this.§_-5M§ - this.§_-Qu§ - this.g * this.t1 * this.t1 / 2) / this.t1;
         this.rotation = Math.random() * 100;
      }
      
      private function setLevelSettings() : void
      {
         this.§_-Fi§ = this.cRoot.gameSettings.engineers.bfg.clusterArea;
         this.minDamage = this.cRoot.gameSettings.engineers.bfg.clusterMinDamage;
         this.maxDamage = this.cRoot.gameSettings.engineers.bfg.clusterMaxDamage;
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

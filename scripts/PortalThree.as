package
{
   import flash.events.Event;
   import flash.geom.Point;
   
   public class PortalThree extends Portal
   {
       
      
      public function PortalThree(param1:Point, param2:int, param3:int, param4:EnemyVeznan)
      {
         super(param1,param2,param3,param4);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.enemiesSpawnMax = 3;
         this.enemiesTotalMax = 3;
         this.intervalEnemiesTime = 30;
      }
      
      override protected function getEnemy(param1:int) : Enemy
      {
         return new EnemyDemon(this.§_-9a§,this.cRoot.paths[this.§_-9a§][param1],this.§_-DU§,new Point(this.x,this.y),true);
      }
   }
}

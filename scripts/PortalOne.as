package
{
   import flash.events.Event;
   import flash.geom.Point;
   
   public class PortalOne extends Portal
   {
       
      
      private var group:int;
      
      public function PortalOne(param1:Point, param2:int, param3:int, param4:EnemyVeznan)
      {
         super(param1,param2,param3,param4);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         var _loc2_:Number = Math.random();
         if(_loc2_ <= 0.5)
         {
            this.group = 1;
            this.enemiesTotalMax = this.enemiesSpawnMax = this.getRandom(4,6);
         }
         else if(_loc2_ > 0.5 && _loc2_ <= 0.8)
         {
            this.group = 2;
            this.enemiesTotalMax = this.enemiesSpawnMax = 3;
         }
         else
         {
            this.group = 3;
            this.enemiesTotalMax = this.enemiesSpawnMax = 6;
         }
         this.intervalEnemiesTime = 30;
      }
      
      override protected function getEnemy(param1:int) : Enemy
      {
         switch(this.group)
         {
            case 1:
               return new EnemyDemon(this.§_-9a§,this.cRoot.paths[this.§_-9a§][param1],this.§_-DU§,new Point(this.x,this.y),true);
            case 2:
               return new EnemyDemonWolf(this.§_-9a§,this.cRoot.paths[this.§_-9a§][param1],this.§_-DU§,new Point(this.x,this.y),true);
            case 3:
               if(this.enemiesMaxIndex <= 5)
               {
                  return new EnemyDemon(this.§_-9a§,this.cRoot.paths[this.§_-9a§][param1],this.§_-DU§,new Point(this.x,this.y),true);
               }
               return new EnemyDemonMage(this.§_-9a§,this.cRoot.paths[this.§_-9a§][param1],this.§_-DU§,new Point(this.x,this.y),true);
            default:
               return null;
         }
      }
   }
}

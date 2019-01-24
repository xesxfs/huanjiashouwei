package
{
   import flash.display.MovieClip;
   
   public class Graveyard extends MovieClip
   {
       
      
      private var §_-Dy§:Array;
      
      private var §_-FZ§:int;
      
      private var §_-9a§:int;
      
      private var §_-DU§:int;
      
      private var §_-QW§:int;
      
      private var cRoot:Level;
      
      public function Graveyard(param1:Level, param2:int, param3:int, param4:Array)
      {
         super();
         this.cRoot = param1;
         this.x = 91;
         this.y = 184;
         this.§_-9a§ = param2;
         this.§_-DU§ = param3;
         this.§_-Dy§ = param4;
         this.§_-FZ§ = 0;
         this.§_-QW§ = 0;
      }
      
      public function spawnSkeleton(param1:int) : void
      {
         var _loc2_:Enemy = null;
         this.§_-QW§++;
         if(this.§_-QW§ > 2)
         {
            this.§_-QW§ = 0;
         }
         if(param1 < this.cRoot.gameSettings.specials.graveyard.limitLifeCondition)
         {
            _loc2_ = new EnemySkeleton(this.§_-9a§,this.cRoot.paths[this.§_-9a§][this.§_-QW§],this.§_-DU§,this.§_-Dy§[this.§_-FZ§]);
            if(!this.cRoot.game.gameEncyclopedia.notificationEnemySkeletor)
            {
               this.cRoot.game.gameEncyclopedia.notificationEnemySkeletor = true;
               this.cRoot.game.gameEncyclopedia.saveData();
            }
         }
         else
         {
            _loc2_ = new EnemySkeletonBig(this.§_-9a§,this.cRoot.paths[this.§_-9a§][this.§_-QW§],this.§_-DU§,this.§_-Dy§[this.§_-FZ§]);
            if(!this.cRoot.game.gameEncyclopedia.notificationEnemySkeletorBig)
            {
               this.cRoot.game.gameEncyclopedia.notificationEnemySkeletorBig = true;
               this.cRoot.game.gameEncyclopedia.saveData();
            }
         }
         this.cRoot.entities.addChild(_loc2_);
         this.cRoot.enemies[_loc2_] = _loc2_;
         this.§_-FZ§++;
         if(this.§_-FZ§ >= this.§_-Dy§.length)
         {
            this.§_-FZ§ = 0;
         }
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
      }
   }
}

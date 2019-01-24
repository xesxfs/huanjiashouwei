package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class YetiEgg extends MovieClip
   {
       
      
      private var §_-9a§:int;
      
      private var §_-DU§:int;
      
      private var isActive:Boolean = true;
      
      private var fadeTime:int = 1;
      
      private var fadeTimeCounter:int = 0;
      
      private var enemiesCurrentNodeIndex:int;
      
      private var §_-Px§:Boolean;
      
      private var intervalTime:int;
      
      private var intervalTimeCounter:int;
      
      private var intervalEnemiesTime:int;
      
      private var intervalEnemiesTimeCounter:int;
      
      private var enemiesTotalMax:int;
      
      private var enemiesSpawnMax:int;
      
      private var enemiesMaxIndex:int;
      
      private var enemiesSpawnIndex:int;
      
      private var type:String;
      
      private var §_-Sz§:EnemyYetiBoss;
      
      private var cRoot:Level;
      
      public function YetiEgg(param1:Point, param2:int, param3:int, param4:EnemyYetiBoss, param5:String)
      {
         super();
         this.§_-9a§ = param2;
         this.§_-DU§ = param3;
         this.x = param1.x;
         this.y = param1.y;
         this.type = param5;
         this.§_-Sz§ = param4;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         if(this.type == "WOLF")
         {
            this.enemiesTotalMax = this.enemiesSpawnMax = this.cRoot.gameSettings.enemies.yetiBoss.maxWolf;
            this.intervalEnemiesTime = this.cRoot.gameSettings.enemies.yetiBoss.wolfSpawnInterval;
         }
         else
         {
            this.enemiesTotalMax = this.enemiesSpawnMax = this.cRoot.gameSettings.enemies.yetiBoss.maxYetis;
            this.intervalEnemiesTime = this.cRoot.gameSettings.enemies.yetiBoss.yetisSpawnInterval;
         }
         this.§_-Px§ = false;
         this.intervalTime = 1;
         this.intervalTimeCounter = 0;
         this.intervalEnemiesTimeCounter = 0;
         this.enemiesMaxIndex = 0;
         this.enemiesSpawnIndex = 0;
         this.enemiesCurrentNodeIndex = 0;
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            if(this.fadeTimeCounter < this.fadeTime)
            {
               this.fadeTimeCounter++;
               if(this.fadeTimeCounter >= 50)
               {
                  this.alpha = this.alpha - 0.07;
               }
               return;
            }
            this.destroyThis();
         }
         if(this.§_-Sz§ == null || !this.§_-Sz§.isActive)
         {
            this.isActive = false;
            return;
         }
         if(!this.§_-Px§)
         {
            if(this.intervalTimeCounter < this.intervalTime)
            {
               this.intervalTimeCounter++;
               return;
            }
            this.§_-Px§ = true;
            this.intervalEnemiesTimeCounter = this.intervalEnemiesTime;
            this.enemiesCurrentNodeIndex = 0;
         }
         if(this.intervalEnemiesTimeCounter < this.intervalEnemiesTime)
         {
            this.intervalEnemiesTimeCounter++;
            return;
         }
         this.spawnEnemy(this.enemiesCurrentNodeIndex);
         this.intervalEnemiesTimeCounter = 0;
         this.enemiesSpawnIndex++;
         this.enemiesMaxIndex++;
         this.enemiesCurrentNodeIndex++;
         if(this.enemiesCurrentNodeIndex > 2)
         {
            this.enemiesCurrentNodeIndex = 0;
         }
         if(this.enemiesMaxIndex == this.enemiesTotalMax)
         {
            this.isActive = false;
            return;
         }
         if(this.enemiesSpawnIndex == this.enemiesSpawnMax)
         {
            this.intervalTimeCounter = 0;
            this.enemiesSpawnIndex = 0;
            this.§_-Px§ = false;
         }
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrame != this.totalFrames)
         {
            this.play();
         }
      }
      
      private function spawnEnemy(param1:int) : void
      {
         var _loc2_:Enemy = null;
         if(this.type == "WOLF")
         {
            _loc2_ = new EnemyWhiteWolf(this.§_-9a§,this.cRoot.paths[this.§_-9a§][param1],this.§_-DU§,new Point(this.x,this.y));
         }
         else
         {
            _loc2_ = new EnemyYeti(this.§_-9a§,this.cRoot.paths[this.§_-9a§][param1],this.§_-DU§,new Point(this.x,this.y));
         }
         this.cRoot.entities.addChild(_loc2_);
         this.cRoot.enemies[_loc2_] = _loc2_;
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}

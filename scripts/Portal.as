package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class Portal extends MovieClip
   {
       
      
      protected var §_-04§:§_-JA§;
      
      protected var §_-9a§:int;
      
      protected var §_-DU§:int;
      
      protected var isActive:Boolean = true;
      
      protected var fadeTime:int = 10;
      
      protected var fadeTimeCounter:int = 0;
      
      protected var enemiesCurrentNodeIndex:int;
      
      protected var §_-Px§:Boolean;
      
      protected var intervalTime:int;
      
      protected var intervalTimeCounter:int;
      
      protected var intervalEnemiesTime:int;
      
      protected var intervalEnemiesTimeCounter:int;
      
      protected var enemiesTotalMax:int;
      
      protected var enemiesSpawnMax:int;
      
      protected var enemiesMaxIndex:int;
      
      protected var enemiesSpawnIndex:int;
      
      protected var type:String;
      
      protected var veznan:EnemyVeznan;
      
      protected var cRoot:Level;
      
      public function Portal(param1:Point, param2:int, param3:int, param4:EnemyVeznan)
      {
         super();
         this.§_-9a§ = param2;
         this.§_-DU§ = param3;
         this.x = param1.x;
         this.y = param1.y;
         this.type = this.type;
         this.veznan = param4;
         this.§_-Px§ = false;
         this.intervalTime = 1;
         this.intervalTimeCounter = 0;
         this.intervalEnemiesTimeCounter = 0;
         this.enemiesMaxIndex = 0;
         this.enemiesSpawnIndex = 0;
         this.enemiesCurrentNodeIndex = 0;
         this.§_-04§ = new §_-JA§();
         this.addChild(this.§_-04§);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            if(this.fadeTimeCounter < this.fadeTime)
            {
               this.fadeTimeCounter++;
               return;
            }
            this.destroyThis();
         }
         if(this.veznan == null || this.veznan.isDead)
         {
            this.isActive = false;
            this.§_-04§.gotoAndPlay("out");
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
            this.§_-04§.gotoAndPlay("out");
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
         switch(this.currentFrameLabel)
         {
            case "idleEnd":
               this.§_-04§.gotoAndPlay("idle");
               break;
            case "outEnd":
               break;
            default:
               this.§_-04§.play();
         }
      }
      
      protected function spawnEnemy(param1:int) : void
      {
         var _loc2_:Enemy = this.getEnemy(param1);
         this.cRoot.entities.addChild(_loc2_);
         this.cRoot.enemies[_loc2_] = _loc2_;
      }
      
      protected function getEnemy(param1:int) : Enemy
      {
         return null;
      }
      
      protected function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      public function destroyThis() : void
      {
         this.removeChild(this.§_-04§);
         this.§_-04§ = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}

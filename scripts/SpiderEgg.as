package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class SpiderEgg extends MovieClip
   {
       
      
      private var §_-9a§:int;
      
      private var §_-DU§:int;
      
      private var isActive:Boolean = true;
      
      private var fadeTime:int = 120;
      
      private var fadeTimeCounter:int = 0;
      
      private var spiderCurrentNodeIndex:int;
      
      private var §_-Px§:Boolean;
      
      private var intervalTime:int;
      
      private var intervalTimeCounter:int;
      
      private var intervalSpiderTime:int;
      
      private var intervalSpiderTimeCounter:int;
      
      private var spidersTotalMax:int;
      
      private var spidersSpawnMax:int;
      
      private var spiderMaxIndex:int;
      
      private var spiderSpawnIndex:int;
      
      private var §_-9r§:Boolean;
      
      private var cRoot:Level;
      
      public function SpiderEgg(param1:Point, param2:int, param3:int, param4:Boolean = true)
      {
         super();
         addFrameScript(88,this.frame89);
         this.§_-9a§ = param2;
         this.§_-DU§ = param3;
         this.§_-9r§ = param4;
         this.x = param1.x;
         this.y = param1.y;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.spidersTotalMax = this.spidersSpawnMax = this.cRoot.gameSettings.enemies.spider.eggsSpiders;
         this.§_-Px§ = false;
         this.intervalTime = 85;
         this.intervalSpiderTime = 6;
         this.intervalTimeCounter = 0;
         this.intervalSpiderTimeCounter = 0;
         this.spiderMaxIndex = 0;
         this.spiderSpawnIndex = 0;
         this.spiderCurrentNodeIndex = 0;
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
         if(!this.§_-Px§)
         {
            if(this.intervalTimeCounter < this.intervalTime)
            {
               this.intervalTimeCounter++;
               return;
            }
            this.§_-Px§ = true;
            this.intervalSpiderTimeCounter = this.intervalSpiderTime;
            this.spiderCurrentNodeIndex = 0;
         }
         if(this.intervalSpiderTimeCounter < this.intervalSpiderTime)
         {
            this.intervalSpiderTimeCounter++;
            return;
         }
         this.§_-Ln§(this.spiderCurrentNodeIndex);
         this.intervalSpiderTimeCounter = 0;
         this.spiderSpawnIndex++;
         this.spiderMaxIndex++;
         this.spiderCurrentNodeIndex++;
         if(this.spiderCurrentNodeIndex > 2)
         {
            this.spiderCurrentNodeIndex = 0;
         }
         if(this.spiderMaxIndex == this.spidersTotalMax)
         {
            this.isActive = false;
            return;
         }
         if(this.spiderSpawnIndex == this.spidersSpawnMax)
         {
            this.intervalTimeCounter = 0;
            this.spiderSpawnIndex = 0;
            this.§_-Px§ = false;
         }
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         this.play();
      }
      
      private function §_-Ln§(param1:int) : void
      {
         var _loc2_:Enemy = null;
         if(this.§_-9r§)
         {
            _loc2_ = new EnemySpiderTiny(this.§_-9a§,this.cRoot.paths[this.§_-9a§][param1],this.§_-DU§,new Point(this.x,this.y));
         }
         else
         {
            _loc2_ = new EnemySpiderTinyRotten(this.§_-9a§,this.cRoot.paths[this.§_-9a§][param1],this.§_-DU§,new Point(this.x,this.y));
         }
         this.cRoot.entities.addChild(_loc2_);
         this.cRoot.enemies[_loc2_] = _loc2_;
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame89() : *
      {
         stop();
      }
   }
}

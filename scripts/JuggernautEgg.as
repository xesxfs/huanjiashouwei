package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class JuggernautEgg extends MovieClip
   {
       
      
      private var §_-9a§:int;
      
      private var §_-DU§:int;
      
      private var isActive:Boolean = true;
      
      private var fadeTime:int = 120;
      
      private var fadeTimeCounter:int = 0;
      
      private var §_-GR§:int;
      
      private var §_-Px§:Boolean;
      
      private var intervalTime:int;
      
      private var intervalTimeCounter:int;
      
      private var intervalHeadTime:int;
      
      private var intervalHeadTimeCounter:int;
      
      private var §_-Kp§:int;
      
      private var §_-Af§:int;
      
      private var §_-S9§:int;
      
      private var §_-Nr§:int;
      
      private var juggernaut:EnemyJuggernaut;
      
      private var sName:String;
      
      private var cRoot:Level;
      
      public function JuggernautEgg(param1:Point, param2:int, param3:int, param4:EnemyJuggernaut)
      {
         super();
         addFrameScript(19,this.frame20);
         this.§_-9a§ = param2;
         this.§_-DU§ = param3;
         this.x = param1.x;
         this.y = param1.y;
         this.juggernaut = param4;
         this.sName = Math.random().toString();
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playBombSound();
         this.§_-Kp§ = this.§_-Af§ = this.cRoot.gameSettings.enemies.juggernaut.golemHeads;
         this.§_-Px§ = false;
         this.intervalTime = 2;
         this.intervalHeadTime = 6;
         this.intervalTimeCounter = 0;
         this.intervalHeadTimeCounter = 0;
         this.§_-S9§ = 0;
         this.§_-Nr§ = 0;
         this.§_-GR§ = 0;
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
         if(this.juggernaut == null || !this.juggernaut.isActive)
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
            this.intervalHeadTimeCounter = this.intervalHeadTime;
            this.§_-GR§ = 0;
         }
         if(this.intervalHeadTimeCounter < this.intervalHeadTime)
         {
            this.intervalHeadTimeCounter++;
            return;
         }
         this.§break§(this.§_-GR§);
         this.intervalHeadTimeCounter = 0;
         this.§_-Nr§++;
         this.§_-S9§++;
         this.§_-GR§++;
         if(this.§_-GR§ > 2)
         {
            this.§_-GR§ = 0;
         }
         if(this.§_-S9§ == this.§_-Kp§)
         {
            this.isActive = false;
            return;
         }
         if(this.§_-Nr§ == this.§_-Af§)
         {
            this.intervalTimeCounter = 0;
            this.§_-Nr§ = 0;
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
      
      private function §break§(param1:int) : void
      {
         var _loc2_:Enemy = new EnemyGolemHead(this.§_-9a§,this.cRoot.paths[this.§_-9a§][param1],this.§_-DU§,new Point(this.x,this.y));
         this.cRoot.entities.addChild(_loc2_);
         this.cRoot.enemies[_loc2_] = _loc2_;
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.juggernaut = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame20() : *
      {
         stop();
      }
   }
}

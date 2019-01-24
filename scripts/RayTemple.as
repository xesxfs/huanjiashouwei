package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class RayTemple extends MovieClip
   {
       
      
      protected var target:Enemy;
      
      protected var durationTime:int;
      
      protected var durationTimeCounter:int;
      
      protected var level:int;
      
      protected var §_-Lo§:Number;
      
      protected var §_-6k§:Number = 0;
      
      protected var §_-4W§:Number = 0;
      
      protected var §_-IR§:Number = 0;
      
      protected var §_-Jy§:Number = 0;
      
      protected var §_-0c§:Number = 0;
      
      protected var minDamage:int;
      
      protected var maxDamage:int;
      
      protected var sName:String;
      
      protected var cRoot:Level;
      
      protected var §_-0Y§:MovieClip = null;
      
      public function RayTemple(param1:Point, param2:Enemy, param3:int)
      {
         super();
         addFrameScript(9,this.frame10);
         this.x = param1.x;
         this.y = param1.y;
         this.level = param3;
         this.target = param2;
         this.sName = Math.random().toString();
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.§_-HH§();
         this.cRoot.game.gameAchievement.§_-2B§(this.cRoot);
         this.durationTime = 11;
         this.durationTimeCounter = 0;
         this.minDamage = this.cRoot.gameSettings.specials.templeTower.minDamage + this.cRoot.gameSettings.specials.templeTower.damageIncrement * this.level;
         this.maxDamage = this.cRoot.gameSettings.specials.templeTower.maxDamage + this.cRoot.gameSettings.specials.templeTower.damageIncrement * this.level;
         this.§_-0Y§ = new §_-DI§(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust));
         this.cRoot.bullets.addChild(this.§_-0Y§);
         this.§_-0W§();
      }
      
      public function onFrameUpdate() : void
      {
         if(this.durationTimeCounter == this.durationTime)
         {
            this.destroyThis();
            return;
         }
         if(this.target == null || !this.target.isActive)
         {
            this.durationTimeCounter++;
            return;
         }
         if(this.durationTimeCounter == 2)
         {
            MovieClip(this.target).templeHit(this.getDamage());
         }
         this.follow();
         this.durationTimeCounter++;
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "rayEnd")
         {
            this.play();
         }
      }
      
      protected function getDamage() : int
      {
         return this.minDamage + Math.ceil(Math.random() * (this.maxDamage - this.minDamage));
      }
      
      protected function §_-0W§() : void
      {
         this.§_-CZ§();
         this.§_-Lo§ = this.width = Math.sqrt(this.§_-4W§ * this.§_-4W§ + this.§_-6k§ * this.§_-6k§);
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
      }
      
      protected function follow() : void
      {
         this.§_-CZ§();
         this.scaleX = this.scaleX * (1 + (Math.sqrt(this.§_-4W§ * this.§_-4W§ + this.§_-6k§ * this.§_-6k§) - this.§_-Lo§) / this.§_-Lo§);
         this.§_-Lo§ = Math.sqrt(this.§_-4W§ * this.§_-4W§ + this.§_-6k§ * this.§_-6k§);
         this.rotation = 360 - Math.atan2(-this.§_-IR§,this.§_-Jy§) * 180 / Math.PI;
         if(this.§_-0Y§ != null)
         {
            this.§_-0Y§.x = this.target.x + this.target.xAdjust;
            this.§_-0Y§.y = this.target.y + this.target.yAdjust;
         }
      }
      
      protected function §_-CZ§() : void
      {
         this.§_-4W§ = this.target.x + this.target.xAdjust - this.x;
         this.§_-6k§ = this.target.y + this.target.yAdjust - this.y;
         this.§_-0c§ = Math.atan2(this.§_-6k§,this.§_-4W§);
         this.§_-IR§ = Math.sin(this.§_-0c§);
         this.§_-Jy§ = Math.cos(this.§_-0c§);
      }
      
      protected function destroyThis() : void
      {
         this.target = null;
         if(this.§_-0Y§ != null)
         {
            this.cRoot.bullets.removeChild(this.§_-0Y§);
            this.§_-0Y§ = null;
         }
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame10() : *
      {
         stop();
      }
   }
}

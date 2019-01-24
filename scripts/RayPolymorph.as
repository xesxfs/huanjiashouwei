package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class RayPolymorph extends MovieClip
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
      
      public function RayPolymorph(param1:Point, param2:Enemy, param3:int)
      {
         super();
         addFrameScript(10,this.frame11);
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
         this.durationTime = 30;
         this.durationTimeCounter = 0;
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
            this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"puff"));
            EnemyCommon(this.target).polymorph(this.level);
         }
         if(this.durationTimeCounter <= 2)
         {
            this.follow();
         }
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
         this.cRoot = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame11() : *
      {
         stop();
      }
   }
}

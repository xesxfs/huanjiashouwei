package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-OM§ extends MovieClip
   {
       
      
      protected var isActive:Boolean = true;
      
      protected var §_-J7§:int = 35;
      
      protected var §_-Rn§:int = 0;
      
      protected var §_-Jy§:Number;
      
      protected var §_-IR§:Number;
      
      protected var §_-6v§:Number;
      
      protected var §_-5M§:Number;
      
      protected var §_-FC§:Number;
      
      protected var §_-Qu§:Number;
      
      protected var t0:Number;
      
      protected var t1:Number;
      
      protected var g:Number = 1;
      
      protected var tInvisibles:int;
      
      protected var §_-9a§:int;
      
      protected var §_-DU§:int;
      
      protected var juggernaut:EnemyJuggernaut;
      
      protected var cRoot:Level;
      
      public function §_-OM§(param1:Point, param2:Point, param3:int, param4:int, param5:int, param6:EnemyJuggernaut)
      {
         super();
         addFrameScript(0,this.frame1,19,this.frame20);
         this.§_-6v§ = param2.x;
         this.§_-5M§ = param2.y;
         this.x = this.§_-FC§ = param1.x;
         this.y = this.§_-Qu§ = param1.y;
         this.tInvisibles = param5;
         this.§_-9a§ = param3;
         this.§_-DU§ = param4;
         this.juggernaut = param6;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            this.fadeThis();
            return;
         }
         if(this.tInvisibles != 0 && this.tInvisibles == this.t0)
         {
            this.alpha = 1;
         }
         if(this.juggernaut == null || !this.juggernaut.isActive)
         {
            this.isActive = false;
            this.gotoAndPlay("airHit");
            return;
         }
         this.x = this.§_-FC§ + this.t0 * this.§_-Jy§;
         this.y = this.§_-Qu§ + this.t0 * this.§_-IR§ + this.g * this.t0 * this.t0 / 2;
         this.rotateBomb();
         if(this.t0 == this.t1)
         {
            this.hit();
            return;
         }
         this.t0++;
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrameLabel != "idle" && this.currentFrameLabel != "airHitEnd")
         {
            this.play();
         }
      }
      
      protected function fadeThis() : void
      {
         if(this.§_-Rn§ == this.§_-J7§)
         {
            this.destroyThis();
         }
         this.§_-Rn§++;
      }
      
      protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playBombShootSound();
         this.t0 = 0;
         var _loc2_:Number = Point.distance(new Point(this.x,this.y),new Point(this.§_-6v§,this.§_-5M§));
         this.t1 = 20 + Math.floor(_loc2_ / 14);
         this.§_-Jy§ = (this.§_-6v§ - this.§_-FC§) / this.t1;
         this.§_-IR§ = (this.§_-5M§ - this.§_-Qu§ - this.g * this.t1 * this.t1 / 2) / this.t1;
         this.rotation = Math.random() * 100;
      }
      
      protected function rotateBomb() : void
      {
         this.rotation = this.rotation + 20;
      }
      
      protected function hit() : void
      {
         this.rotation = 0;
         this.cRoot.addToDecal(new JuggernautEgg(new Point(this.x,this.y),this.§_-9a§,this.§_-DU§,this.juggernaut));
         this.destroyThis();
      }
      
      protected function destroyThis() : void
      {
         this.cRoot = null;
         this.juggernaut = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
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

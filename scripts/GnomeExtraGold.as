package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class GnomeExtraGold extends MovieClip
   {
       
      
      public var anim:MovieClip;
      
      private var lifeTime:int = 48;
      
      private var §_-PB§:int = 0;
      
      private var cRoot:Level;
      
      public function GnomeExtraGold(param1:Point, param2:Level)
      {
         super();
         addFrameScript(47,this.frame48);
         this.x = param1.x;
         this.y = param1.y;
         this.cRoot = param2;
         if(this.cRoot.§_-D4§ == Level.LEVEL_PAUSED)
         {
            this.pause();
         }
         this.anim.txtMoney.text = "$" + Math.round(this.cRoot.gameSettings.§_-Fu§ * this.cRoot.§_-6Y§);
      }
      
      public function onFrameUpdate() : void
      {
         this.§_-PB§++;
         if(this.§_-PB§ >= this.lifeTime)
         {
            this.destroyThis();
            return;
         }
         if(this.§_-PB§ == 13)
         {
            this.cRoot.updateCash(Math.round(this.cRoot.gameSettings.§_-Fu§ * this.cRoot.§_-6Y§));
         }
         if(this.§_-PB§ == 2)
         {
            this.cRoot.game.gameSounds.§_-Cq§();
         }
      }
      
      public function pause() : void
      {
         this.stop();
         this.anim.stop();
      }
      
      public function unPause() : void
      {
         if(this.currentFrame != this.totalFrames)
         {
            this.play();
            this.anim.play();
         }
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
      
      function frame48() : *
      {
         stop();
      }
   }
}

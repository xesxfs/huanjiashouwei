package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   import org.casalib.math.geom.Ellipse;
   
   public class §_-7A§ extends MovieClip
   {
       
      
      protected var level:int;
      
      protected var isActive:Boolean;
      
      protected var fadeTime:int;
      
      protected var fadeTimeCounter:int;
      
      protected var rangewidth:int;
      
      protected var rangeHeight:int;
      
      protected var tarDuration:int;
      
      protected var §_-6§:int;
      
      protected var tarReload:int;
      
      protected var tarReloadTime:int;
      
      protected var cRoot:Level;
      
      public function §_-7A§(param1:Point, param2:int, param3:Level)
      {
         super();
         addFrameScript(8,this.frame9,17,this.frame18);
         this.x = param1.x;
         this.y = param1.y;
         this.level = param2;
         this.cRoot = param3;
         this.cRoot.game.gameSounds.§_-L8§();
         this.tarDuration = (this.cRoot.gameSettings.heroes.heroDwarf.tarDurationTime + this.cRoot.gameSettings.heroes.heroDwarf.tarDurationTimeIncrement * this.level) * this.cRoot.gameSettings.framesRate;
         this.§_-6§ = 0;
         this.tarReload = 10;
         this.tarReloadTime = 0;
         this.rangewidth = this.cRoot.gameSettings.heroes.heroDwarf.tarRangeApplyWidth;
         this.rangeHeight = this.rangewidth * this.cRoot.gameSettings.rangeRatio;
         this.isActive = true;
         this.fadeTime = 9;
         this.fadeTimeCounter = 0;
      }
      
      public function onFrameUpdate() : void
      {
         var _loc1_:Enemy = null;
         if(!this.isActive)
         {
            this.fadeTimeCounter++;
            if(this.fadeTime == this.fadeTimeCounter)
            {
               this.destroyThis();
            }
            return;
         }
         this.§_-6§++;
         if(this.tarDuration == this.§_-6§)
         {
            this.isActive = false;
            this.fadeTimeCounter = 0;
            this.gotoAndPlay("end");
            return;
         }
         if(this.tarReloadTime < this.tarReload)
         {
            this.tarReloadTime++;
            return;
         }
         for each(_loc1_ in this.cRoot.enemies)
         {
            if(_loc1_.isActive && this.onRangeTar(_loc1_))
            {
               _loc1_.addDebuff(new DebuffSlowTarBomb(this.cRoot,1,_loc1_));
            }
         }
         this.tarReloadTime = 0;
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         switch(this.currentFrameLabel)
         {
            case "idle":
               break;
            case "endEnd":
               break;
            default:
               this.play();
         }
      }
      
      private function onRangeTar(param1:Enemy) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.rangewidth / 2,this.y - this.rangeHeight / 2,this.rangewidth,this.rangeHeight);
         return _loc2_.containsPoint(new Point(param1.x,param1.y));
      }
      
      private function destroyThis() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
      
      function frame9() : *
      {
         stop();
      }
      
      function frame18() : *
      {
         stop();
      }
   }
}

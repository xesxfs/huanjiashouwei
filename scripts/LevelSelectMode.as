package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class LevelSelectMode extends MovieClip
   {
       
      
      protected var tooltip:LevelSelectModeTooltip;
      
      protected var tooltipPosition:Point;
      
      protected var modeStatus:Boolean;
      
      protected var mode:int;
      
      protected var cRoot:LevelSelect;
      
      public function LevelSelectMode(param1:Point, param2:LevelSelect, param3:Boolean, param4:Point, param5:int)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.cRoot = param2;
         this.modeStatus = param3;
         this.tooltipPosition = param4;
         this.mode = param5;
         if(!this.modeStatus)
         {
            this.tooltip = new LevelSelectModeTooltip();
            this.tooltip.x = param4.x;
            this.tooltip.y = param4.y;
            this.gotoAndStop("locked");
         }
         else if(this.mode != GameSettings.§_-OS§ && this.cRoot.thumb.data.heroicMode && !this.cRoot.thumb.data.heroicModeView)
         {
            this.gotoAndStop("locked");
         }
         else
         {
            this.gotoAndStop("idle");
         }
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
      }
      
      protected function click(param1:MouseEvent) : void
      {
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.cRoot.thumb.map.game.gameSounds.playGUIMouseOverCommon();
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         if(!this.modeStatus)
         {
            this.gotoAndStop("lockedover");
            this.showTooltip();
         }
         else
         {
            this.gotoAndStop("over");
         }
      }
      
      protected function showTooltip() : void
      {
         this.cRoot.addChild(this.tooltip);
      }
      
      protected function hideTooltip() : void
      {
         if(this.tooltip != null && this.cRoot.contains(this.tooltip))
         {
            this.cRoot.removeChild(this.tooltip);
         }
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.cRoot.thumb.map.game.gameSounds.stopGUIMouseOverCommon();
         this.useHandCursor = false;
         if(!this.modeStatus)
         {
            this.gotoAndStop("locked");
            this.hideTooltip();
         }
         else if(this.cRoot.selectedMode == this.mode)
         {
            this.gotoAndStop("selected");
         }
         else
         {
            this.gotoAndStop("idle");
         }
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         if(!this.modeStatus)
         {
            return;
         }
         if(this.cRoot.selectedMode == this.mode)
         {
            this.gotoAndStop("selected");
         }
         else
         {
            this.gotoAndStop("press");
         }
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         if(!this.modeStatus)
         {
            return;
         }
         if(this.cRoot.selectedMode == this.mode)
         {
            this.gotoAndStop("selected");
         }
         else
         {
            this.gotoAndStop("over");
         }
      }
      
      public function destroyThis() : void
      {
         this.hideTooltip();
         this.tooltip = null;
         this.cRoot = null;
         this.removeEventListener(MouseEvent.CLICK,this.click);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         this.parent.removeChild(this);
      }
   }
}

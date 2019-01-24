package
{
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class LevelSelectModeHeroic extends LevelSelectMode
   {
       
      
      public function LevelSelectModeHeroic(param1:Point, param2:LevelSelect, param3:Boolean, param4:Point, param5:int)
      {
         addFrameScript(0,this.frame1);
         super(param1,param2,param3,param4,param5);
      }
      
      override protected function click(param1:MouseEvent) : void
      {
         if(!this.modeStatus)
         {
            return;
         }
         if(this.cRoot.selectedMode == GameSettings.§_-R6§)
         {
            return;
         }
         this.gotoAndStop("idle");
         this.cRoot.thumb.map.game.gameSounds.playGUIButtonCommon();
         this.cRoot.setMode(GameSettings.§_-R6§);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}

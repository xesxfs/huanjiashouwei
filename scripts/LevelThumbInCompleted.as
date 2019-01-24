package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class LevelThumbInCompleted extends LevelThumb
   {
       
      
      public var lock:MovieClip;
      
      public function LevelThumbInCompleted(param1:Map, param2:Point, param3:SaveDataLevel)
      {
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3,3,this.frame4,4,this.frame5);
         super(param1,param2,param3);
      }
      
      override protected function evaluateStatus() : void
      {
         switch(this.data.levelStatus)
         {
            case SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_NEW:
               if(this.data.levelIndex != 0)
               {
                  this.data.setStatus(SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED);
               }
               this.gotoAndStop("new");
               break;
            case SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED:
               this.gotoAndStop("idle");
               break;
            case SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_LOCKED:
               this.gotoAndStop("locked");
         }
      }
      
      override protected function clickEvent(param1:MouseEvent) : void
      {
         if(this.map.itemsLocked)
         {
            return;
         }
         if(this.data.levelStatus == SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_LOCKED)
         {
            return;
         }
         if(this.data.levelIndex == 0)
         {
            this.map.destroySign();
         }
         this.map.game.gameSounds.playGUIButtonCommon();
         this.map.addMapBlock();
         this.map.addChild(new LevelSelect(this));
         this.goToSelected();
      }
      
      override protected function rollOver(param1:MouseEvent) : void
      {
         this.map.game.gameSounds.playGUIMouseOverCommon();
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         if(this.data.levelStatus == SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_LOCKED)
         {
            this.gotoAndStop("overLocked");
            this.map.addStageWarning(this.data.levelIndex);
         }
         else
         {
            this.gotoAndStop("over");
         }
      }
      
      override protected function rollOut(param1:MouseEvent) : void
      {
         this.map.game.gameSounds.stopGUIMouseOverCommon();
         this.useHandCursor = false;
         if(this.data.levelStatus == SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_LOCKED)
         {
            this.gotoAndStop("locked");
            this.map.removeStageWarning();
         }
         else
         {
            this.gotoAndStop("idle");
         }
      }
      
      override protected function goToSelected() : void
      {
         if(this.data.levelStatus == SaveDataLevel.LEVEL_ENABLED_UNCOMPLETED_LOCKED)
         {
            this.gotoAndStop("overLocked");
         }
         else
         {
            this.gotoAndStop("over");
         }
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame2() : *
      {
         stop();
      }
      
      function frame3() : *
      {
         stop();
      }
      
      function frame4() : *
      {
         stop();
      }
      
      function frame5() : *
      {
         stop();
      }
   }
}

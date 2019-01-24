package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class LevelThumbCompleted extends LevelThumb
   {
       
      
      public var star1:MovieClip;
      
      public var star2:MovieClip;
      
      public var star3:MovieClip;
      
      public var heroic:MovieClip;
      
      public var anim_new:MovieClip;
      
      private var starsRender:Boolean;
      
      private var starsRenderedNormal:Boolean;
      
      public function LevelThumbCompleted(param1:Map, param2:Point, param3:SaveDataLevel)
      {
         addFrameScript(0,this.frame1);
         super(param1,param2,param3);
      }
      
      override protected function evaluateStatus() : void
      {
         if(this.data.heroicModeRecently)
         {
            if(!this.data.ironModeWin)
            {
               this.gotoAndStop("completedAgain");
            }
            else
            {
               this.gotoAndStop("completedIronAgain");
            }
            this.loadNewStars();
            this.heroic.gotoAndPlay("new");
            this.loadStars();
            this.data.heroicModeRecently = false;
            return;
         }
         if(this.data.ironModeRecently)
         {
            this.gotoAndStop("completedIron");
            this.loadNewStars();
            this.loadStars();
            this.data.ironModeRecently = false;
            if(this.data.heroicModeWin)
            {
               this.heroic.gotoAndStop("completed");
            }
            else
            {
               this.heroic.visible = false;
            }
            return;
         }
         switch(this.data.levelStatus)
         {
            case SaveDataLevel.LEVEL_ENABLED_COMPLETED_NEW:
               this.data.levelStatus = SaveDataLevel.LEVEL_ENABLED_COMPLETED;
               this.gotoAndStop("new");
               this.loadNewStars();
               break;
            case SaveDataLevel.LEVEL_ENABLED_COMPLETED_BETTER:
               this.data.setStatus(SaveDataLevel.LEVEL_ENABLED_COMPLETED);
               this.gotoAndStop("new");
               this.loadNewStars();
               break;
            case SaveDataLevel.LEVEL_ENABLED_COMPLETED:
               if(!this.data.ironModeWin)
               {
                  this.gotoAndStop("idle");
               }
               else
               {
                  this.gotoAndStop("idleIron");
               }
               this.loadStars();
         }
         if(this.data.heroicModeWin)
         {
            this.heroic.gotoAndStop("completed");
         }
         else
         {
            this.heroic.visible = false;
         }
      }
      
      override protected function rollOver(param1:MouseEvent) : void
      {
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.map.game.gameSounds.playGUIMouseOverCommon();
         if(!this.data.ironModeWin)
         {
            this.gotoAndStop("over");
         }
         else
         {
            this.gotoAndStop("selectedIron");
         }
         if(!this.starsRenderedNormal)
         {
            this.loadStars();
            this.starsRenderedNormal = true;
         }
      }
      
      private function loadStars() : void
      {
         switch(this.data.stars)
         {
            case 1:
               if(this.currentLabel == "completedAgain" || this.currentLabel == "completedIron" || this.currentLabel == "completedIronAgain")
               {
                  this.star1.gotoAndStop("onEnd");
                  this.star2.gotoAndStop("off");
                  this.star3.gotoAndStop("off");
                  break;
               }
               this.star1.gotoAndStop("on");
               this.star2.gotoAndStop("off");
               this.star3.gotoAndStop("off");
               break;
            case 2:
               if(this.currentLabel == "completedAgain" || this.currentLabel == "completedIron" || this.currentLabel == "completedIronAgain")
               {
                  this.star1.gotoAndStop("onEnd");
                  this.star2.gotoAndStop("onEnd");
                  this.star3.gotoAndStop("off");
                  break;
               }
               this.star1.gotoAndStop("on");
               this.star2.gotoAndStop("on");
               this.star3.gotoAndStop("off");
               break;
            case 3:
               if(this.currentLabel == "completedAgain" || this.currentLabel == "completedIron" || this.currentLabel == "completedIronAgain")
               {
                  this.star1.gotoAndStop("onEnd");
                  this.star2.gotoAndStop("onEnd");
                  this.star3.gotoAndStop("onEnd");
                  break;
               }
               this.star1.gotoAndStop("on");
               this.star2.gotoAndStop("on");
               this.star3.gotoAndStop("on");
               break;
         }
         this.starsRender = true;
      }
      
      private function loadNewStars() : void
      {
         switch(this.data.stars)
         {
            case 0:
               this.star1.gotoAndStop("off");
               this.star2.gotoAndStop("off");
               this.star3.gotoAndStop("off");
               break;
            case 1:
               this.star1.gotoAndPlay("on");
               this.star2.gotoAndStop("off");
               this.star3.gotoAndStop("off");
               break;
            case 2:
               this.star1.gotoAndPlay("on");
               this.star2.gotoAndPlay("on");
               this.star3.gotoAndStop("off");
               break;
            case 3:
               this.star1.gotoAndPlay("on");
               this.star2.gotoAndPlay("on");
               this.star3.gotoAndPlay("on");
         }
      }
      
      override protected function goToSelected() : void
      {
         if(!this.data.ironModeWin)
         {
            this.gotoAndStop("selected");
         }
         else
         {
            this.gotoAndStop("selectedIron");
         }
         if(!this.starsRenderedNormal)
         {
            this.loadStars();
            this.starsRenderedNormal = true;
         }
      }
      
      override protected function rollOut(param1:MouseEvent) : void
      {
         this.map.game.gameSounds.stopGUIMouseOverCommon();
         this.useHandCursor = false;
         if(!this.data.ironModeWin)
         {
            this.gotoAndStop("idle");
         }
         else
         {
            this.gotoAndStop("idleIron");
         }
         if(!this.starsRenderedNormal)
         {
            this.loadStars();
            this.starsRenderedNormal = true;
         }
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}

package
{
   import com.adobe.utils.StringUtil;
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class NotificationSecondLevel extends MovieClip
   {
      
      protected static const §_-7-§:int = 0;
      
      protected static const §_-I1§:int = 1;
      
      protected static const §_-BQ§:int = 2;
       
      
      public var notificationBase:MovieClip;
      
      public var position:int;
      
      protected var status:int;
      
      protected var level:Level;
      
      public var pauseNotification:String;
      
      protected var notificationClose:NotificationClose;
      
      protected var §_-P8§:Tween;
      
      protected var outTimer:int = 8;
      
      protected var outTimerCounter:int = 0;
      
      public function NotificationSecondLevel(param1:Level, param2:String)
      {
         super();
         this.status = §_-7-§;
         this.level = param1;
         this.level.game.gameSounds.playGUINotificationPopup();
         this.pauseNotification = param2;
         this.getBase(param2);
         this.getPortrait();
         this.notificationClose = new NotificationClose();
         this.notificationClose.x = 2;
         this.notificationClose.y = 41;
         this.addChild(this.notificationClose);
         this.notificationClose.addEventListener(MouseEvent.CLICK,this.close,false,0,true);
         this.notificationClose.addEventListener(MouseEvent.ROLL_OVER,this.closeRollOver,false,0,true);
         this.notificationClose.addEventListener(MouseEvent.ROLL_OUT,this.closeRollOut,false,0,true);
         this.notificationClose.addEventListener(MouseEvent.MOUSE_DOWN,this.closeMouseDown,false,0,true);
         this.notificationClose.addEventListener(MouseEvent.MOUSE_UP,this.closeMouseUp,false,0,true);
         this.notificationBase.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         this.notificationBase.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.notificationBase.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.notificationBase.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.notificationBase.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
         this.notificationClose.visible = false;
      }
      
      public function update() : void
      {
         if(this.status == §_-7-§)
         {
            return;
         }
         if(this.status == §_-BQ§)
         {
            if(this.outTimerCounter < this.outTimer)
            {
               this.outTimerCounter++;
               return;
            }
            this.destroyThis();
         }
      }
      
      public function getBase(param1:String) : void
      {
         param1 = StringUtil.remove(param1,"Notification").toLowerCase();
         if(StringUtil.beginsWith(param1,"enemy"))
         {
            this.notificationBase.type.gotoAndStop("creep");
         }
         else if(StringUtil.beginsWith(param1,"tower") || StringUtil.beginsWith(param1,"power"))
         {
            this.notificationBase.type.gotoAndStop("unlock");
         }
         else if(StringUtil.beginsWith(param1,"tip"))
         {
            this.notificationBase.type.gotoAndStop("tip");
         }
         else if(StringUtil.beginsWith(param1,"alert"))
         {
            this.notificationBase.type.gotoAndStop("alert");
         }
      }
      
      public function moveTo(param1:int) : void
      {
         this.status = §_-I1§;
         this.§_-P8§ = new Tween(this,"y",Strong.easeOut,this.y,param1,0.7,true);
         this.§_-P8§.addEventListener(TweenEvent.MOTION_FINISH,this.moveFinish,false,0,true);
      }
      
      public function moveFinish(param1:TweenEvent) : *
      {
         this.status = §_-7-§;
         this.position--;
      }
      
      public function click(param1:MouseEvent) : void
      {
         if(this.status != §_-7-§)
         {
            return;
         }
         if(this.notificationClose.hitTestPoint(this.x + mouseX,this.y + mouseY,true))
         {
            return;
         }
         if(this.level.data.levelIndex == 0 && Level1(this.level).notificationSign != null)
         {
            Level1(this.level).notificationSign.closeMe();
         }
         this.level.notificationHolder.notificationSelected = this;
         this.level.sendPauseNotification(this.pauseNotification);
      }
      
      public function close(param1:MouseEvent) : void
      {
         if(this.status != §_-7-§)
         {
            return;
         }
         this.closeMe();
      }
      
      public function closeMe() : void
      {
         if(this.status != §_-7-§)
         {
            return;
         }
         this.level.notificationHolder.removeNotification(this.position);
         this.notificationClose.visible = false;
         this.status = §_-BQ§;
         this.notificationBase.gotoAndPlay("close");
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         if(this.notificationClose.hitTestPoint(this.x + mouseX,this.y + mouseY,true))
         {
            return;
         }
         this.level.game.gameSounds.playGUIMouseOverCommon();
         this.notificationBase.buttonMode = true;
         this.notificationBase.mouseChildren = false;
         this.notificationBase.useHandCursor = true;
         this.notificationBase.gotoAndStop("over");
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         if(this.notificationClose.hitTestPoint(this.x + mouseX,this.y + mouseY,true))
         {
            return;
         }
         this.level.game.gameSounds.stopGUIMouseOverCommon();
         this.notificationBase.useHandCursor = false;
         this.notificationBase.gotoAndStop("idle");
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         if(this.notificationClose.hitTestPoint(this.x + mouseX,this.y + mouseY,true))
         {
            return;
         }
         this.notificationBase.gotoAndStop("press");
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         if(this.notificationClose.hitTestPoint(this.x + mouseX,this.y + mouseY,true))
         {
            return;
         }
         this.notificationBase.gotoAndStop("over");
      }
      
      protected function getPortrait() : void
      {
         var _loc1_:String = StringUtil.remove(this.pauseNotification.toLowerCase(),"notification").toLowerCase();
         if(StringUtil.beginsWith(_loc1_,"enemy"))
         {
            this.notificationBase.type.portrait.gotoAndStop(StringUtil.remove(this.pauseNotification.toLowerCase(),"notificationenemy"));
         }
         else if(StringUtil.beginsWith(_loc1_,"tip"))
         {
            this.notificationBase.type.portrait.gotoAndStop(StringUtil.remove(this.pauseNotification.toLowerCase(),"notificationtip"));
         }
         else if(StringUtil.beginsWith(_loc1_,"alert"))
         {
            this.notificationBase.type.portrait.gotoAndStop(StringUtil.remove(this.pauseNotification.toLowerCase(),"notificationalert"));
         }
      }
      
      protected function closeRollOver(param1:MouseEvent) : void
      {
         this.notificationClose.buttonMode = true;
         this.notificationClose.mouseChildren = false;
         this.notificationClose.useHandCursor = true;
         this.notificationBase.gotoAndStop("idle");
         this.notificationClose.gotoAndStop("over");
      }
      
      protected function closeRollOut(param1:MouseEvent) : void
      {
         this.notificationClose.useHandCursor = false;
         this.notificationClose.gotoAndStop("idle");
      }
      
      protected function closeMouseDown(param1:MouseEvent) : void
      {
         this.notificationClose.gotoAndStop("press");
      }
      
      protected function closeMouseUp(param1:MouseEvent) : void
      {
         this.notificationClose.gotoAndStop("over");
      }
      
      protected function initAction(param1:String) : void
      {
         param1 = StringUtil.remove(param1,"Notification").toLowerCase();
         if(StringUtil.beginsWith(param1,"enemy"))
         {
            return;
         }
         switch(param1)
         {
            case "powerreinforcement":
               this.level.unlockPowerReinforcement();
               break;
            case "powerfireball":
               this.level.unlockPowerFireball();
               break;
            case "towerlevel2":
               this.level.unlockMaxMages = 2;
               this.level.unlockMaxArchers = 2;
               this.level.unlockMaxBarracks = 2;
               this.level.unlockMaxEngineers = 2;
               break;
            case "towerlevel3":
               this.level.unlockMaxMages = 3;
               this.level.unlockMaxArchers = 3;
               this.level.unlockMaxBarracks = 3;
               this.level.unlockMaxEngineers = 3;
               break;
            case "towerarcherranger":
               this.level.unlockMaxArchers = 4;
               break;
            case "towerarchermusketeer":
               this.level.unlockMaxArchers = 5;
               break;
            case "towersoldierpaladin":
               this.level.unlockMaxBarracks = 4;
               break;
            case "towersoldierbarbarian":
               this.level.unlockMaxBarracks = 5;
               break;
            case "towermage":
               this.level.unlockMaxMages = 1;
               this.level.updateCash(100);
               break;
            case "towermagearcane":
               this.level.unlockMaxMages = 4;
               break;
            case "towermagesorcerer":
               this.level.unlockMaxMages = 5;
               break;
            case "towerengineer":
               this.level.unlockMaxEngineers = 1;
               break;
            case "towerengineerbfg":
               this.level.unlockMaxEngineers = 4;
               break;
            case "towerengineertesla":
               this.level.unlockMaxEngineers = 5;
         }
      }
      
      protected function destroyThis() : void
      {
         this.level = null;
         this.§_-P8§ = null;
         this.notificationBase.removeEventListener(MouseEvent.CLICK,this.click);
         this.notificationBase.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.notificationBase.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.notificationBase.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.notificationBase.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         this.notificationClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.notificationClose.removeEventListener(MouseEvent.ROLL_OVER,this.closeRollOver);
         this.notificationClose.removeEventListener(MouseEvent.ROLL_OUT,this.closeRollOut);
         this.notificationClose.removeEventListener(MouseEvent.MOUSE_DOWN,this.closeMouseDown);
         this.notificationClose.removeEventListener(MouseEvent.MOUSE_UP,this.closeMouseUp);
         this.parent.removeChild(this);
      }
   }
}

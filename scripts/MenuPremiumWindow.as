package
{
   import com.reintroducing.sound.SoundManager;
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class MenuPremiumWindow extends MovieClip
   {
       
      
      public var but_buyPremium:MovieClip;
      
      public var but_ok:MovieClip;
      
      public var butClose:§_-5D§;
      
      private var yTween:Tween;
      
      private var alphaTween:Tween;
      
      private var mainMenu:MainMenu;
      
      private var game:Game;
      
      private var automatic:String;
      
      private var onFirst:Boolean;
      
      public function MenuPremiumWindow(param1:Game, param2:MainMenu = null, param3:Boolean = false, param4:String = "")
      {
         var § 0§:Game = param1;
         var § 1§:MainMenu = param2;
         var § 2§:Boolean = param3;
         var § 3§:String = param4;
         super();
         this.x = 355;
         this.y = 30;
         this.game = § 0§;
         this.automatic = § 3§;
         this.mainMenu = § 1§;
         if(this.game != null)
         {
            this.game.gameSounds.playGUIButtonCommon();
            if(this.game.main.kongregate.services.isGuest())
            {
               this.setProcess("promo");
            }
            else
            {
               this.gotoAndStop("loading");
               try
               {
                  this.game.main.kongregate.mtx.requestUserItemList(null,this.getOnlineDataFirst);
               }
               catch(err:Error)
               {
                  this.setProcess("promo");
               }
            }
         }
         else
         {
            SoundManager.getInstance().stopSound("gui_button_common");
            SoundManager.getInstance().playSound("gui_button_common",1,0,0);
            if(!§ 2§)
            {
               if(!Defense(this.mainMenu.parent).mpc)
               {
                  this.setInitLoggedOut();
               }
               else
               {
                  this.setProcess("success");
               }
            }
            else
            {
               this.gotoAndStop("loading");
            }
         }
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function updatePC(param1:Boolean) : void
      {
         if(!param1)
         {
            this.setInitLoggedOut();
         }
         else
         {
            this.setProcess("success");
         }
      }
      
      public function init(param1:Event) : void
      {
         this.yTween = new Tween(this,"y",Strong.easeOut,this.y - 50,this.y,0.7,true);
         this.alphaTween = new Tween(this,"alpha",Strong.easeOut,0,1,0.7,true);
      }
      
      public function setInitLoggedOut() : void
      {
         this.gotoAndStop("sell");
         this.but_buyPremium.gotoAndStop("idle");
         this.but_buyPremium.addEventListener(MouseEvent.CLICK,this.buy,false,0,true);
         this.but_buyPremium.addEventListener(MouseEvent.ROLL_OVER,this.rollOverBuy,false,0,true);
         this.but_buyPremium.addEventListener(MouseEvent.ROLL_OUT,this.rollOutBuy,false,0,true);
         this.but_buyPremium.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownBuy,false,0,true);
         this.but_buyPremium.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpBuy,false,0,true);
         this.butClose.gotoAndStop("idle");
         this.butClose.addEventListener(MouseEvent.CLICK,this.closeClickEvent,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OVER,this.closeRollOverEvents,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OUT,this.closeRollOutEvents,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_DOWN,this.closeMouseDown,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_UP,this.closeMouseUp,false,0,true);
      }
      
      public function setProcess(param1:String) : void
      {
         this.gotoAndStop(param1);
         this.but_ok.gotoAndStop("idle");
         this.but_ok.addEventListener(MouseEvent.CLICK,this.checkBuy,false,0,true);
         this.but_ok.addEventListener(MouseEvent.ROLL_OVER,this.rollOverCheckBuy,false,0,true);
         this.but_ok.addEventListener(MouseEvent.ROLL_OUT,this.rollOutCheckBuy,false,0,true);
         this.but_ok.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownCheckBuy,false,0,true);
         this.but_ok.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpCheckBuy,false,0,true);
      }
      
      protected function buy(param1:MouseEvent) : void
      {
         this.removeListeners();
         this.game.gameSounds.playGUIButtonCommon();
         this.showKredsDialog();
         this.setProcess("process");
      }
      
      public function showKredsDialog() : void
      {
         if(this.game.main.kongregate == null)
         {
            return;
         }
         try
         {
            this.game.main.kongregate.mtx.purchaseItems(["kr_kong_pc"],this.onPurchaseResult);
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      public function onPurchaseResult(param1:Object) : *
      {
      }
      
      public function hideFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      protected function rollOverBuy(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIMouseOverCommon();
         this.but_buyPremium.buttonMode = true;
         this.but_buyPremium.mouseChildren = false;
         this.but_buyPremium.useHandCursor = true;
         this.but_buyPremium.gotoAndStop("over");
      }
      
      protected function rollOutBuy(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.but_buyPremium.useHandCursor = false;
         this.but_buyPremium.gotoAndStop("idle");
      }
      
      protected function mouseDownBuy(param1:MouseEvent) : void
      {
         this.but_buyPremium.gotoAndStop("press");
      }
      
      protected function mouseUpBuy(param1:MouseEvent) : void
      {
         this.but_buyPremium.gotoAndStop("idle");
      }
      
      protected function checkBuy(param1:MouseEvent) : void
      {
         this.removeListeners();
         this.game.gameSounds.playGUIButtonCommon();
         if(this.currentFrameLabel == "process")
         {
            this.gotoAndStop("loading");
            this.game.main.kongregate.mtx.requestUserItemList(null,this.getOnlineData);
         }
         else
         {
            this.game.map.§_-Gg§();
            this.yTween = new Tween(this,"y",Strong.easeOut,this.y,this.y - 50,0.7,true);
            this.alphaTween = new Tween(this,"alpha",Strong.easeOut,1,0,0.7,true);
            this.yTween.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
         }
      }
      
      protected function getOnlineData(param1:Object) : void
      {
         if(param1.success && param1.data.length > 0)
         {
            this.setProcess("success");
            this.givePremiumContent();
         }
         else
         {
            this.setProcess("fail");
         }
      }
      
      protected function getOnlineDataFirst(param1:Object) : void
      {
         if(param1.success && param1.data.length > 0)
         {
            this.setProcess("promo");
         }
         else
         {
            this.setInitLoggedOut();
         }
      }
      
      protected function givePremiumContent() : void
      {
         if(this.game != null)
         {
            this.game.pc = true;
            this.game.§_-55§();
            this.game.map.updateStars();
            this.game.map.§_-No§();
         }
         else
         {
            this.mainMenu.§_-GY§();
         }
      }
      
      protected function rollOverCheckBuy(param1:MouseEvent) : void
      {
         if(this.game != null)
         {
            this.game.gameSounds.playGUIMouseOverCommon();
         }
         else
         {
            SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         }
         this.but_ok.buttonMode = true;
         this.but_ok.mouseChildren = false;
         this.but_ok.useHandCursor = true;
         this.but_ok.gotoAndStop("over");
      }
      
      protected function rollOutCheckBuy(param1:MouseEvent) : void
      {
         if(this.game != null)
         {
            this.game.gameSounds.stopGUIMouseOverCommon();
         }
         else
         {
            SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         }
         this.but_ok.useHandCursor = false;
         this.but_ok.gotoAndStop("idle");
      }
      
      protected function mouseDownCheckBuy(param1:MouseEvent) : void
      {
         this.but_ok.gotoAndStop("press");
      }
      
      protected function mouseUpCheckBuy(param1:MouseEvent) : void
      {
         this.but_ok.gotoAndStop("idle");
      }
      
      public function closeRollOverEvents(param1:MouseEvent) : void
      {
         if(this.game != null)
         {
            this.game.gameSounds.§_-Dh§();
         }
         else
         {
            SoundManager.getInstance().playSound("gui_mouse_over_tower_common",1,0,0);
         }
         this.butClose.buttonMode = true;
         this.butClose.mouseChildren = false;
         this.butClose.useHandCursor = true;
         this.butClose.gotoAndStop("over");
      }
      
      public function closeRollOutEvents(param1:MouseEvent) : void
      {
         if(this.game != null)
         {
            this.game.gameSounds.stopGUIMouseOverCommon();
         }
         else
         {
            SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         }
         this.butClose.useHandCursor = false;
         this.butClose.gotoAndStop("idle");
      }
      
      protected function closeMouseDown(param1:MouseEvent) : void
      {
         this.butClose.gotoAndStop("press");
      }
      
      protected function closeMouseUp(param1:MouseEvent) : void
      {
         this.butClose.gotoAndStop("over");
      }
      
      public function closeClickEvent(param1:MouseEvent) : void
      {
         this.removeListeners();
         if(this.game != null)
         {
            this.game.gameSounds.playGUIButtonCommon();
            this.game.map.§_-Gg§();
         }
         else
         {
            SoundManager.getInstance().stopSound("gui_button_common");
            SoundManager.getInstance().playSound("gui_button_common",1,0,0);
            this.mainMenu.§_-B4§();
         }
         this.yTween = new Tween(this,"y",Strong.easeOut,this.y,this.y - 50,0.7,true);
         this.alphaTween = new Tween(this,"alpha",Strong.easeOut,1,0,0.7,true);
         this.yTween.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
      }
      
      public function removeListeners() : void
      {
         if(this.butClose != null && this.butClose.hasEventListener(MouseEvent.CLICK))
         {
            this.butClose.removeEventListener(MouseEvent.CLICK,this.closeClickEvent);
            this.butClose.removeEventListener(MouseEvent.ROLL_OVER,this.closeRollOverEvents);
            this.butClose.removeEventListener(MouseEvent.ROLL_OUT,this.closeRollOutEvents);
            this.butClose.removeEventListener(MouseEvent.MOUSE_DOWN,this.closeMouseDown);
            this.butClose.removeEventListener(MouseEvent.MOUSE_UP,this.closeMouseUp);
         }
         if(this.but_ok != null && this.but_ok.hasEventListener(MouseEvent.CLICK))
         {
            this.but_ok.removeEventListener(MouseEvent.CLICK,this.checkBuy);
            this.but_ok.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverCheckBuy);
            this.but_ok.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutCheckBuy);
            this.but_ok.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownCheckBuy);
            this.but_ok.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpCheckBuy);
         }
         if(this.but_buyPremium != null && this.but_buyPremium.hasEventListener(MouseEvent.CLICK))
         {
            this.but_buyPremium.removeEventListener(MouseEvent.CLICK,this.buy);
            this.but_buyPremium.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverBuy);
            this.but_buyPremium.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutBuy);
            this.but_buyPremium.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownBuy);
            this.but_buyPremium.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpBuy);
         }
      }
      
      public function destroyThis() : void
      {
         if(this.game != null && this.game.§_-Pd§ && this.game.map != null)
         {
            this.game.map.§_-4z§();
         }
         else if(this.mainMenu != null)
         {
            this.mainMenu.§_-1J§ = null;
         }
         this.removeListeners();
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.yTween.removeEventListener(TweenEvent.MOTION_FINISH,this.hideFinish);
         this.yTween = null;
         this.alphaTween = null;
         this.game = null;
         this.mainMenu = null;
         this.parent.removeChild(this);
      }
   }
}

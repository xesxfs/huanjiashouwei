package
{
   import Playtomic.Log;
   import fl.transitions.Tween;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.trace;
   
   public class MenuSocial extends MovieClip
   {
       
      
      public var §_-PM§:MovieClip;
      
      public var §_-Os§:MovieClip;
      
      public var butCloseOpen:MovieClip;
      
      protected var isOpen:Boolean;
      
      protected var closeOpenEndLabel:String;
      
      protected var §_-P8§:Tween;
      
      protected var ytweenOut:Tween;
      
      protected var game:Game;
      
      public function MenuSocial(param1:Game)
      {
         super();
         this.game = param1;
         this.isOpen = false;
         this.x = 330;
         this.y = -345;
         this.closeOpenEndLabel = "Closed";
         this.§_-PM§.gotoAndStop("idle");
         this.§_-Os§.gotoAndStop("idle");
         this.butCloseOpen.gotoAndStop("idle" + this.closeOpenEndLabel);
         this.§_-PM§.addEventListener(MouseEvent.CLICK,this.§_-52§,false,0,true);
         this.§_-PM§.addEventListener(MouseEvent.ROLL_OVER,this.§_-D3§,false,0,true);
         this.§_-PM§.addEventListener(MouseEvent.ROLL_OUT,this.§_-0w§,false,0,true);
         this.§_-PM§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-OV§,false,0,true);
         this.§_-PM§.addEventListener(MouseEvent.MOUSE_UP,this.§_-Qa§,false,0,true);
         this.§_-Os§.addEventListener(MouseEvent.CLICK,this.facebook,false,0,true);
         this.§_-Os§.addEventListener(MouseEvent.ROLL_OVER,this.§_-S1§,false,0,true);
         this.§_-Os§.addEventListener(MouseEvent.ROLL_OUT,this.§_-AI§,false,0,true);
         this.§_-Os§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-I0§,false,0,true);
         this.§_-Os§.addEventListener(MouseEvent.MOUSE_UP,this.§_-e§,false,0,true);
         this.butCloseOpen.addEventListener(MouseEvent.CLICK,this.closeOpen,false,0,true);
         this.butCloseOpen.addEventListener(MouseEvent.ROLL_OVER,this.rollOverCloseOpen,false,0,true);
         this.butCloseOpen.addEventListener(MouseEvent.ROLL_OUT,this.rollOutCloseOpen,false,0,true);
         this.butCloseOpen.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownCloseOpen,false,0,true);
         this.butCloseOpen.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpCloseOpen,false,0,true);
      }
      
      public function initMe() : void
      {
         this.§_-P8§ = new Tween(this,"y",Strong.easeOut,this.y,-335,0.5,true);
      }
      
      public function showMe() : void
      {
         Map(this.parent).addMapBlock();
         this.parent.swapChildren(this,Map(this.parent).§_-5r§);
         this.§_-P8§ = new Tween(this,"y",Strong.easeOut,this.y,18,0.5,true);
         this.isOpen = true;
         this.closeOpenEndLabel = "Open";
      }
      
      protected function hideMe() : void
      {
         Map(this.parent).§_-Gg§();
         this.§_-P8§ = new Tween(this,"y",Strong.easeOut,this.y,-335,0.5,true);
         this.isOpen = false;
         this.closeOpenEndLabel = "Closed";
      }
      
      protected function closeOpen(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         if(this.isOpen)
         {
            this.hideMe();
         }
         else
         {
            this.showMe();
         }
      }
      
      protected function rollOverCloseOpen(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.butCloseOpen.buttonMode = true;
         this.butCloseOpen.mouseChildren = false;
         this.butCloseOpen.useHandCursor = true;
         this.butCloseOpen.gotoAndStop("over" + this.closeOpenEndLabel);
      }
      
      protected function rollOutCloseOpen(param1:MouseEvent) : void
      {
         this.butCloseOpen.useHandCursor = false;
         this.butCloseOpen.gotoAndStop("idle" + this.closeOpenEndLabel);
      }
      
      protected function mouseDownCloseOpen(param1:MouseEvent) : void
      {
         this.butCloseOpen.gotoAndStop("press" + this.closeOpenEndLabel);
      }
      
      protected function mouseUpCloseOpen(param1:MouseEvent) : void
      {
         this.butCloseOpen.gotoAndStop("idle" + this.closeOpenEndLabel);
      }
      
      protected function facebook(param1:MouseEvent) : void
      {
         if(this.game.earnFacebookSocial())
         {
            Map(this.parent).earnFacebookSocial();
         }
         this.game.gameSounds.playGUIButtonCommon();
         Log.CustomMetric("Link Weibo Social","Social",true);
         Log.ForceSend();
         var _loc3_:URLRequest = new URLRequest("http://www.weibo.com/u/2843581860");
         trace(_loc3_,"_blank");
      }
      
      protected function §_-S1§(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.§_-Os§.buttonMode = true;
         this.§_-Os§.mouseChildren = false;
         this.§_-Os§.useHandCursor = true;
         this.§_-Os§.gotoAndStop("over");
      }
      
      protected function §_-AI§(param1:MouseEvent) : void
      {
         this.§_-Os§.useHandCursor = false;
         this.§_-Os§.gotoAndStop("idle");
      }
      
      protected function §_-I0§(param1:MouseEvent) : void
      {
         this.§_-Os§.gotoAndStop("press");
      }
      
      protected function §_-e§(param1:MouseEvent) : void
      {
         this.§_-Os§.gotoAndStop("idle");
      }
      
      protected function §_-52§(param1:MouseEvent) : void
      {
         if(this.game.earnTwitterSocial())
         {
            Map(this.parent).earnTwitterSocial();
         }
         this.game.gameSounds.playGUIButtonCommon();
         Log.CustomMetric("Link Tencent Social","Social",true);
         Log.ForceSend();
         var _loc3_:URLRequest = new URLRequest("http://t.qq.com/kingdom-rush");
         trace(_loc3_,"_blank");
      }
      
      protected function §_-D3§(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.§_-PM§.buttonMode = true;
         this.§_-PM§.mouseChildren = false;
         this.§_-PM§.useHandCursor = true;
         this.§_-PM§.gotoAndStop("over");
      }
      
      protected function §_-0w§(param1:MouseEvent) : void
      {
         this.§_-PM§.useHandCursor = false;
         this.§_-PM§.gotoAndStop("idle");
      }
      
      protected function §_-OV§(param1:MouseEvent) : void
      {
         this.§_-PM§.gotoAndStop("press");
      }
      
      protected function §_-Qa§(param1:MouseEvent) : void
      {
         this.§_-PM§.gotoAndStop("idle");
      }
      
      public function destroyThis() : void
      {
         this.game.map.itemsLocked = false;
         this.game = null;
         this.ytweenOut = null;
         this.§_-P8§ = null;
         this.§_-PM§.removeEventListener(MouseEvent.CLICK,this.§_-52§);
         this.§_-PM§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-D3§);
         this.§_-PM§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-0w§);
         this.§_-PM§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-OV§);
         this.§_-PM§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Qa§);
         this.§_-Os§.removeEventListener(MouseEvent.CLICK,this.facebook);
         this.§_-Os§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-S1§);
         this.§_-Os§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-AI§);
         this.§_-Os§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-I0§);
         this.§_-Os§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-e§);
         this.butCloseOpen.removeEventListener(MouseEvent.CLICK,this.closeOpen);
         this.butCloseOpen.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverCloseOpen);
         this.butCloseOpen.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutCloseOpen);
         this.butCloseOpen.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownCloseOpen);
         this.butCloseOpen.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpCloseOpen);
         this.parent.removeChild(this);
      }
   }
}

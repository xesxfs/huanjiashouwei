package
{
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MenuPremium extends MovieClip
   {
       
      
      public var checkbox_reinforce:MovieClip;
      
      public var checkbox_lightning:MovieClip;
      
      public var radio_1:MovieClip;
      
      public var radio_2:MovieClip;
      
      public var radio_3:MovieClip;
      
      public var radio_4:MovieClip;
      
      public var butSubmit:MovieClip;
      
      public var checkbox_gold:MovieClip;
      
      protected var hitAreaExtraGold:PremiumContentHitArea;
      
      protected var hitAreaExtraSpell:PremiumContentHitArea;
      
      protected var hitAreaExtraReinforcement:PremiumContentHitArea;
      
      protected var hitAreaReinforcementNormal:PremiumContentHitArea;
      
      protected var hitAreaReinforcementStars:PremiumContentHitArea;
      
      protected var hitAreaReinforcementMortal:PremiumContentHitArea;
      
      protected var hitAreaReinforcementStreet:PremiumContentHitArea;
      
      protected var §_-P8§:Tween;
      
      protected var ytweenOut:Tween;
      
      public var game:Game;
      
      public function MenuPremium(param1:Game)
      {
         super();
         this.game = param1;
         this.x = 350;
         this.§_-P8§ = new Tween(this,"y",Strong.easeOut,-550,5,0.5,true);
         this.butSubmit.gotoAndStop("idle");
         this.hitAreaExtraGold = new PremiumContentHitArea(new Point(-280,144),60,555,this,"extra_gold");
         this.hitAreaExtraSpell = new PremiumContentHitArea(new Point(-280,220),60,555,this,"extra_spell");
         this.hitAreaExtraReinforcement = new PremiumContentHitArea(new Point(-280,295),60,555,this,"extra_reinforcement");
         this.hitAreaReinforcementNormal = new PremiumContentHitArea(new Point(-280,413),50,130,this,"reinforcement_normal");
         this.hitAreaReinforcementStars = new PremiumContentHitArea(new Point(-139,413),50,130,this,"reinforcement_stars");
         this.hitAreaReinforcementMortal = new PremiumContentHitArea(new Point(3,413),50,130,this,"reinforcement_mortal");
         this.hitAreaReinforcementStreet = new PremiumContentHitArea(new Point(143,413),50,130,this,"reinforcement_street");
         this.addChild(this.hitAreaExtraGold);
         this.addChild(this.hitAreaExtraSpell);
         this.addChild(this.hitAreaExtraReinforcement);
         this.addChild(this.hitAreaReinforcementNormal);
         this.addChild(this.hitAreaReinforcementStars);
         this.addChild(this.hitAreaReinforcementMortal);
         this.addChild(this.hitAreaReinforcementStreet);
         this.butSubmit.addEventListener(MouseEvent.CLICK,this.submit,false,0,true);
         this.butSubmit.addEventListener(MouseEvent.ROLL_OVER,this.rollOverSubmit,false,0,true);
         this.butSubmit.addEventListener(MouseEvent.ROLL_OUT,this.rollOutSubmit,false,0,true);
         this.butSubmit.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownSubmit,false,0,true);
         this.butSubmit.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpSubmit,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
         this.setExtraGold();
         this.setExtraSpell();
         this.setExtraReinforcement();
         this.setReinforcement();
      }
      
      public function setExtraGold() : void
      {
         if(this.game.pcHasGold)
         {
            this.checkbox_gold.gotoAndStop(1);
         }
         else
         {
            this.checkbox_gold.gotoAndStop(2);
         }
      }
      
      public function setExtraSpell() : void
      {
         if(this.game.pcLightning)
         {
            this.checkbox_lightning.gotoAndStop(1);
         }
         else
         {
            this.checkbox_lightning.gotoAndStop(2);
         }
      }
      
      public function setExtraReinforcement() : void
      {
         if(this.game.pcExtraReinforcement)
         {
            this.checkbox_reinforce.gotoAndStop(1);
         }
         else
         {
            this.checkbox_reinforce.gotoAndStop(2);
         }
      }
      
      public function setReinforcement() : void
      {
         switch(this.game.pcSelectedReinforcement)
         {
            case GameSettings.§_-8-§:
               this.radio_1.gotoAndStop(1);
               this.radio_2.gotoAndStop(2);
               this.radio_3.gotoAndStop(2);
               this.radio_4.gotoAndStop(2);
               break;
            case GameSettings.§_-1§:
               this.radio_1.gotoAndStop(2);
               this.radio_2.gotoAndStop(1);
               this.radio_3.gotoAndStop(2);
               this.radio_4.gotoAndStop(2);
               break;
            case GameSettings.§_-TL§:
               this.radio_1.gotoAndStop(2);
               this.radio_2.gotoAndStop(2);
               this.radio_3.gotoAndStop(1);
               this.radio_4.gotoAndStop(2);
               break;
            case GameSettings.§_-Oh§:
               this.radio_1.gotoAndStop(2);
               this.radio_2.gotoAndStop(2);
               this.radio_3.gotoAndStop(2);
               this.radio_4.gotoAndStop(1);
         }
      }
      
      public function execAction(param1:String) : void
      {
         switch(param1)
         {
            case "extra_gold":
               if(this.game.pcHasGold)
               {
                  this.game.pcHasGold = false;
               }
               else
               {
                  this.game.pcHasGold = true;
               }
               this.setExtraGold();
               break;
            case "extra_spell":
               if(this.game.pcLightning)
               {
                  this.game.pcLightning = false;
               }
               else
               {
                  this.game.pcLightning = true;
               }
               this.setExtraSpell();
               break;
            case "extra_reinforcement":
               if(this.game.pcExtraReinforcement)
               {
                  this.game.pcExtraReinforcement = false;
               }
               else
               {
                  this.game.pcExtraReinforcement = true;
               }
               this.setExtraReinforcement();
               break;
            case "reinforcement_normal":
               this.game.pcSelectedReinforcement = GameSettings.§_-8-§;
               this.setReinforcement();
               break;
            case "reinforcement_stars":
               this.game.pcSelectedReinforcement = GameSettings.§_-1§;
               this.setReinforcement();
               break;
            case "reinforcement_mortal":
               this.game.pcSelectedReinforcement = GameSettings.§_-TL§;
               this.setReinforcement();
               break;
            case "reinforcement_street":
               this.game.pcSelectedReinforcement = GameSettings.§_-Oh§;
               this.setReinforcement();
         }
      }
      
      protected function submit(param1:MouseEvent) : void
      {
         this.butSubmit.removeEventListener(MouseEvent.CLICK,this.submit);
         this.game.gameSounds.playGUIButtonCommon();
         this.game.map.§_-Gg§();
         this.ytweenOut = new Tween(this,"y",Strong.easeIn,this.y,-550,0.3,true);
         this.ytweenOut.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
         this.game.§_-9V§();
      }
      
      public function hideFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      protected function rollOverSubmit(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.butSubmit.buttonMode = true;
         this.butSubmit.mouseChildren = false;
         this.butSubmit.useHandCursor = true;
         this.butSubmit.gotoAndStop("over");
      }
      
      protected function rollOutSubmit(param1:MouseEvent) : void
      {
         this.butSubmit.useHandCursor = false;
         this.butSubmit.gotoAndStop("idle");
      }
      
      protected function mouseDownSubmit(param1:MouseEvent) : void
      {
         this.butSubmit.gotoAndStop("press");
      }
      
      protected function mouseUpSubmit(param1:MouseEvent) : void
      {
         this.butSubmit.gotoAndStop("idle");
      }
      
      protected function destroyThis() : void
      {
         this.game.map.itemsLocked = false;
         this.game = null;
         this.hitAreaExtraGold.destroyThis();
         this.hitAreaExtraSpell.destroyThis();
         this.hitAreaExtraReinforcement.destroyThis();
         this.hitAreaReinforcementNormal.destroyThis();
         this.hitAreaReinforcementStars.destroyThis();
         this.hitAreaReinforcementMortal.destroyThis();
         this.hitAreaReinforcementStreet.destroyThis();
         this.hitAreaExtraGold = null;
         this.hitAreaExtraSpell = null;
         this.hitAreaExtraReinforcement = null;
         this.hitAreaReinforcementNormal = null;
         this.hitAreaReinforcementStars = null;
         this.hitAreaReinforcementMortal = null;
         this.hitAreaReinforcementStreet = null;
         this.butSubmit.removeEventListener(MouseEvent.CLICK,this.submit);
         this.butSubmit.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverSubmit);
         this.butSubmit.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutSubmit);
         this.butSubmit.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownSubmit);
         this.butSubmit.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpSubmit);
         this.ytweenOut.removeEventListener(TweenEvent.MOTION_FINISH,this.hideFinish);
         this.ytweenOut = null;
         this.§_-P8§ = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}

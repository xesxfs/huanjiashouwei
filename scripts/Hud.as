package
{
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class Hud extends MovieClip
   {
       
      
      public var §_-NZ§:TextField;
      
      public var txtWaves:TextField;
      
      public var §_-M9§:MovieClip;
      
      public var txtLives:TextField;
      
      private var cRoot:Level;
      
      private var §_-44§:Tween;
      
      public function Hud(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:Level)
      {
         super();
         this.cRoot = param6;
         this.x = param1;
         this.§_-NZ§.text = param3.toString();
         this.txtLives.text = param4.toString();
         this.updateWaves(0,param5);
         this.§_-44§ = new Tween(this,"y",Strong.easeOut,-20,param2,0.7,true);
         this.§_-44§.addEventListener(TweenEvent.MOTION_FINISH,this.animationEnd,false,0,true);
      }
      
      public function animationEnd(param1:TweenEvent) : *
      {
         if(this.cRoot.game.pc && this.cRoot.game.pcHasGold)
         {
            this.cRoot.bullets.addChild(new GnomeExtraGold(new Point(186,26),this.cRoot));
         }
      }
      
      public function goOut() : void
      {
         this.§_-44§ = new Tween(this,"y",Strong.easeOut,this.y,-50,0.7,true);
      }
      
      public function updateCash(param1:int) : void
      {
         this.§_-NZ§.text = param1.toString();
      }
      
      public function updateLives(param1:int) : void
      {
         this.txtLives.text = param1.toString();
         this.§_-M9§.gotoAndPlay(1);
      }
      
      public function updateWaves(param1:int, param2:int) : void
      {
         this.txtWaves.text = " 回合  " + param1 + "/" + param2;
      }
      
      protected function destroyThis() : void
      {
         this.§_-44§.removeEventListener(TweenEvent.MOTION_FINISH,this.animationEnd);
         this.§_-44§ = null;
         this.cRoot = null;
         this.parent.removeChild(this);
      }
   }
}

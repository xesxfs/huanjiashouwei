package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class PremiumContentHitArea extends MovieClip
   {
       
      
      private var action:String;
      
      private var hit:Sprite;
      
      private var menuPremium:MenuPremium;
      
      public function PremiumContentHitArea(param1:Point, param2:int, param3:int, param4:MenuPremium, param5:String)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.menuPremium = param4;
         this.action = param5;
         this.hit = new Sprite();
         this.hit.graphics.beginFill(16777215);
         this.hit.graphics.drawRect(0,0,param3,param2);
         this.hit.graphics.endFill();
         this.hit.alpha = 0;
         this.addChild(this.hit);
         this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
      }
      
      protected function click(param1:MouseEvent) : void
      {
         this.menuPremium.game.gameSounds.playGUINotificationOver2();
         this.menuPremium.execAction(this.action);
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.hit.alpha = 0.05;
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.hit.alpha = 0;
         this.useHandCursor = false;
      }
      
      public function destroyThis() : void
      {
         this.menuPremium = null;
         this.removeChild(this.hit);
         this.hit = null;
         this.removeEventListener(MouseEvent.CLICK,this.click);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.parent.removeChild(this);
      }
   }
}

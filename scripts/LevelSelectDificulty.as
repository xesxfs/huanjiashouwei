package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class LevelSelectDificulty extends MovieClip
   {
       
      
      public var but_easy:MovieClip;
      
      public var difftxt:TextField;
      
      public var but_selected:MovieClip;
      
      public var but_normal:MovieClip;
      
      protected var isClosed:Boolean;
      
      protected var cRoot:LevelSelect;
      
      public function LevelSelectDificulty(param1:Point, param2:LevelSelect)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.cRoot = param2;
         this.isClosed = true;
         this.gotoAndStop("closed");
         if(this.cRoot.thumb.map.game.difficulty == GameSettings.DIFFICULTY_EASY)
         {
            this.difftxt.text = "簡單難度";
         }
         else if(this.cRoot.thumb.map.game.difficulty == GameSettings.DIFFICULTY_NONE || this.cRoot.thumb.map.game.difficulty == GameSettings.DIFFICULTY_NORMAL)
         {
            this.difftxt.text = "普通難度";
         }
         else if(this.cRoot.thumb.map.game.difficulty == GameSettings.DIFFICULTY_HARD)
         {
            this.difftxt.text = "HARD";
         }
         this.but_selected.addEventListener(MouseEvent.CLICK,this.combo,false,0,true);
         this.but_selected.addEventListener(MouseEvent.ROLL_OVER,this.rollOverSelected,false,0,true);
         this.but_selected.addEventListener(MouseEvent.ROLL_OUT,this.rollOutSelected,false,0,true);
      }
      
      protected function combo(param1:MouseEvent) : void
      {
         if(!this.isClosed)
         {
            this.closeMe();
         }
         else
         {
            this.openMe();
         }
      }
      
      protected function rollOverSelected(param1:MouseEvent) : void
      {
         this.but_selected.buttonMode = true;
         this.but_selected.mouseChildren = false;
         this.but_selected.useHandCursor = true;
         this.but_selected.gotoAndStop("over");
      }
      
      protected function rollOutSelected(param1:MouseEvent) : void
      {
         this.but_selected.useHandCursor = false;
         this.but_selected.gotoAndStop("idle");
      }
      
      protected function openMe() : void
      {
         this.gotoAndStop("open");
         this.but_easy.gotoAndStop("idle");
         this.but_normal.gotoAndStop("idle");
         this.but_easy.addEventListener(MouseEvent.CLICK,this.setEasy,false,0,true);
         this.but_easy.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEasy,false,0,true);
         this.but_easy.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEasy,false,0,true);
         this.but_easy.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownEasy,false,0,true);
         this.but_easy.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpEasy,false,0,true);
         this.but_normal.addEventListener(MouseEvent.CLICK,this.setNormal,false,0,true);
         this.but_normal.addEventListener(MouseEvent.ROLL_OVER,this.rollOverNormal,false,0,true);
         this.but_normal.addEventListener(MouseEvent.ROLL_OUT,this.rollOutNormal,false,0,true);
         this.but_normal.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownNormal,false,0,true);
         this.but_normal.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpNormal,false,0,true);
         this.isClosed = false;
      }
      
      protected function closeMe() : void
      {
         this.but_easy.removeEventListener(MouseEvent.CLICK,this.setEasy);
         this.but_easy.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverEasy);
         this.but_easy.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutEasy);
         this.but_easy.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownEasy);
         this.but_easy.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpEasy);
         this.but_normal.removeEventListener(MouseEvent.CLICK,this.setNormal);
         this.but_normal.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverNormal);
         this.but_normal.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutNormal);
         this.but_normal.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownNormal);
         this.but_normal.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpNormal);
         this.gotoAndStop("closed");
         this.isClosed = true;
      }
      
      protected function setEasy(param1:MouseEvent) : void
      {
         this.cRoot.thumb.map.game.setDifficulty(GameSettings.DIFFICULTY_EASY);
         this.difftxt.text = "簡單難度";
         this.closeMe();
      }
      
      protected function rollOverEasy(param1:MouseEvent) : void
      {
         this.but_easy.buttonMode = true;
         this.but_easy.mouseChildren = false;
         this.but_easy.useHandCursor = true;
         this.but_easy.gotoAndStop("over");
      }
      
      protected function rollOutEasy(param1:MouseEvent) : void
      {
         this.but_easy.useHandCursor = false;
         this.but_easy.gotoAndStop("idle");
      }
      
      protected function mouseDownEasy(param1:MouseEvent) : void
      {
         this.but_easy.gotoAndStop("press");
      }
      
      protected function mouseUpEasy(param1:MouseEvent) : void
      {
         this.but_easy.gotoAndStop("over");
      }
      
      protected function setNormal(param1:MouseEvent) : void
      {
         this.cRoot.thumb.map.game.setDifficulty(GameSettings.DIFFICULTY_NORMAL);
         this.difftxt.text = "普通難度";
         this.closeMe();
      }
      
      protected function rollOverNormal(param1:MouseEvent) : void
      {
         this.but_normal.buttonMode = true;
         this.but_normal.mouseChildren = false;
         this.but_normal.useHandCursor = true;
         this.but_normal.gotoAndStop("over");
      }
      
      protected function rollOutNormal(param1:MouseEvent) : void
      {
         this.but_normal.useHandCursor = false;
         this.but_normal.gotoAndStop("idle");
      }
      
      protected function mouseDownNormal(param1:MouseEvent) : void
      {
         this.but_normal.gotoAndStop("press");
      }
      
      protected function mouseUpNormal(param1:MouseEvent) : void
      {
         this.but_normal.gotoAndStop("over");
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.removeEventListener(MouseEvent.CLICK,this.combo);
         this.parent.removeChild(this);
      }
   }
}

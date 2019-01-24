package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MenuEncyclopediaPolaroidEnemy extends MovieClip
   {
       
      
      public var state:MovieClip;
      
      protected var §_-0o§:Boolean;
      
      protected var f:int;
      
      protected var title:String;
      
      protected var description:String;
      
      protected var damage:String;
      
      protected var health:String;
      
      protected var armor:String;
      
      protected var magicArmor:String;
      
      protected var speed:String;
      
      protected var cost:String;
      
      protected var §_-Ku§:String;
      
      protected var encyclopedia:MenuEncyclopedia;
      
      protected var game:Game;
      
      public function MenuEncyclopediaPolaroidEnemy(param1:Game, param2:MenuEncyclopedia, param3:Boolean, param4:Point, param5:int, param6:String, param7:String, param8:String, param9:String, param10:String, param11:String, param12:String, param13:String, param14:String)
      {
         super();
         this.game = param1;
         this.encyclopedia = param2;
         this.x = param4.x;
         this.y = param4.y;
         this.§_-0o§ = param3;
         this.f = param5;
         this.title = param6;
         this.description = param7;
         this.damage = param9;
         this.health = param8;
         this.armor = param10;
         this.magicArmor = param11;
         this.speed = param12;
         this.cost = param13;
         this.§_-Ku§ = param14;
         if(this.§_-0o§)
         {
            this.gotoAndStop(this.f);
         }
         else
         {
            this.gotoAndStop(this.totalFrames);
         }
         this.state.gotoAndStop("idle");
         this.addEventListener(MouseEvent.CLICK,this.show,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
      }
      
      public function §_-7k§(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.game.gameSounds.playGUINotificationOver2();
         }
         this.encyclopedia.unSelectEnemy();
         this.encyclopedia.selectedItem = this.f;
         this.encyclopedia.§in §.gotoAndStop(this.f);
         this.encyclopedia.§_-Rc§.text = this.title.toUpperCase();
         this.encyclopedia.itemDescription.text = this.description;
         this.encyclopedia.itemHealth.text = this.health;
         this.encyclopedia.itemDmg.text = this.damage;
         this.encyclopedia.itemArmor.text = this.armor;
         this.encyclopedia.itemMagicRes.text = this.magicArmor;
         this.encyclopedia.itemSpeed.text = this.speed;
         if(this.cost == "1")
         {
            this.encyclopedia.§_-M4§.text = this.cost + " 点代价";
         }
         else
         {
            this.encyclopedia.§_-M4§.text = this.cost + " 点代价";
         }
         this.encyclopedia.§_-6n§.text = this.§_-Ku§;
         this.state.gotoAndStop("selected");
      }
      
      protected function show(param1:MouseEvent) : void
      {
         if(!this.§_-0o§)
         {
            return;
         }
         this.§_-7k§();
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         if(!this.§_-0o§)
         {
            return;
         }
         this.game.gameSounds.playGUIMouseOverCommon();
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         if(this.encyclopedia.selectedItem == this.f)
         {
            this.state.gotoAndStop("selected");
         }
         else
         {
            this.state.gotoAndStop("over");
         }
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         if(!this.§_-0o§)
         {
            return;
         }
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.useHandCursor = false;
         if(this.encyclopedia.selectedItem == this.f)
         {
            this.state.gotoAndStop("selected");
         }
         else
         {
            this.state.gotoAndStop("idle");
         }
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         if(!this.§_-0o§)
         {
            return;
         }
         if(this.encyclopedia.selectedItem == this.f)
         {
            this.state.gotoAndStop("selected");
         }
         else
         {
            this.state.gotoAndStop("press");
         }
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         if(!this.§_-0o§)
         {
            return;
         }
         if(this.encyclopedia.selectedItem == this.f)
         {
            this.state.gotoAndStop("selected");
         }
         else
         {
            this.state.gotoAndStop("over");
         }
      }
      
      public function destroyThis() : void
      {
         this.game = null;
         this.encyclopedia = null;
         this.removeEventListener(MouseEvent.CLICK,this.show);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         this.parent.removeChild(this);
      }
   }
}

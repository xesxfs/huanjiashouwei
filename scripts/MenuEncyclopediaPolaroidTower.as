package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MenuEncyclopediaPolaroidTower extends MovieClip
   {
       
      
      public var state:MovieClip;
      
      protected var §_-0o§:Boolean;
      
      protected var f:int;
      
      protected var title:String;
      
      protected var description:String;
      
      protected var type:int;
      
      protected var attackType:int;
      
      protected var damage:String;
      
      protected var reload:String;
      
      protected var range:String;
      
      protected var health:String;
      
      protected var armor:String;
      
      protected var respawn:String;
      
      protected var §_-Ku§:String;
      
      protected var encyclopedia:MenuEncyclopedia;
      
      protected var game:Game;
      
      public function MenuEncyclopediaPolaroidTower(param1:Game, param2:MenuEncyclopedia, param3:Boolean, param4:Point, param5:int, param6:String, param7:String, param8:int, param9:int, param10:String, param11:String, param12:String, param13:String, param14:String, param15:String, param16:String)
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
         this.type = param8;
         this.attackType = param9;
         this.damage = param10;
         this.reload = param11;
         this.range = param12;
         this.health = param13;
         this.armor = param14;
         this.respawn = param15;
         this.§_-Ku§ = param16;
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
         this.encyclopedia.§implements§();
         this.encyclopedia.selectedItemTower = this.f;
         this.encyclopedia.§in §.gotoAndStop(this.f);
         this.encyclopedia.§_-Rc§.text = this.title.toUpperCase();
         this.encyclopedia.itemDescription.text = this.description;
         if(this.§_-Ku§ == "")
         {
            this.encyclopedia.§_-6n§.text = "无";
         }
         else
         {
            this.encyclopedia.§_-6n§.text = this.§_-Ku§;
         }
         if(this.encyclopedia.§_-8s§ != 0 && this.type != this.encyclopedia.§_-8s§)
         {
            if(this.type == 1)
            {
               this.encyclopedia.§_-2g§();
            }
            else
            {
               this.encyclopedia.§_-Re§();
            }
         }
         this.encyclopedia.§_-71§.gotoAndStop(this.type);
         if(this.type == 1)
         {
            this.encyclopedia.§_-71§.ico_attacks.gotoAndStop(this.attackType);
            this.encyclopedia.§_-71§.itemDmg.text = this.damage;
            this.encyclopedia.§_-71§.itemSpeed.text = this.reload;
            this.encyclopedia.§_-71§.itemRange.text = this.range;
            if(this.encyclopedia.§_-8s§ == 0 || this.type != this.encyclopedia.§_-8s§)
            {
               this.encyclopedia.§_-3c§();
            }
         }
         else
         {
            this.encyclopedia.§_-71§.itemHealth.text = this.health;
            this.encyclopedia.§_-71§.itemDmg.text = this.damage;
            this.encyclopedia.§_-71§.itemArmor.text = this.armor;
            this.encyclopedia.§_-71§.itemRespawn.text = this.respawn + "s";
            if(this.encyclopedia.§_-8s§ == 0 || this.type != this.encyclopedia.§_-8s§)
            {
               this.encyclopedia.§_-R9§();
            }
         }
         this.encyclopedia.§_-8s§ = this.type;
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
         if(this.encyclopedia.selectedItemTower == this.f)
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
         if(this.encyclopedia.selectedItemTower == this.f)
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
         if(this.encyclopedia.selectedItemTower == this.f)
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
         if(this.encyclopedia.selectedItemTower == this.f)
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

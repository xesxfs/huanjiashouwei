package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import ironhide.utils.tooltip.TooltipBasicMiddle;
   
   public class MenuBottomTooltip extends MovieClip
   {
       
      
      private var level:Level;
      
      private var tooltipPoint:Point;
      
      private var type:int;
      
      private var hit:Sprite;
      
      public function MenuBottomTooltip(param1:Point, param2:Point, param3:int, param4:int, param5:Level)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.level = param5;
         this.tooltipPoint = param2;
         this.type = param3;
         this.hit = new Sprite();
         this.hit.graphics.beginFill(8921668);
         this.hit.graphics.drawRect(0,0,param4,21);
         this.hit.graphics.endFill();
         this.hit.alpha = 0;
         this.addChild(this.hit);
         this.hit.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents,false,0,true);
         this.hit.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents,false,0,true);
      }
      
      public function rollOverEvents(param1:MouseEvent) : void
      {
         this.createTooltip();
      }
      
      public function rollOutEvents(param1:MouseEvent) : void
      {
         this.level.removeToopTip();
      }
      
      private function createTooltip() : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc1_:String = Locale.getDefaultLang();
         var _loc4_:int = 100;
         switch(this.type)
         {
            case 1:
               _loc2_ = Locale.loadStringEx("MENU_BOTTOM_ATTACK_NAME",_loc1_);
               _loc3_ = Locale.loadStringEx("MENU_BOTTOM_ATTACK_DESCRIPTION",_loc1_);
               _loc4_ = 86;
               break;
            case 2:
               _loc2_ = Locale.loadStringEx("MENU_BOTTOM_RELOAD_NAME",_loc1_);
               _loc3_ = Locale.loadStringEx("MENU_BOTTOM_RELOAD_DESCRIPTION",_loc1_);
               _loc4_ = 70;
               break;
            case 3:
               _loc2_ = Locale.loadStringEx("MENU_BOTTOM_RANGE_NAME",_loc1_);
               _loc3_ = Locale.loadStringEx("MENU_BOTTOM_RANGE_DESCRIPTION",_loc1_);
               _loc4_ = 80;
               break;
            case 4:
               _loc2_ = Locale.loadStringEx("MENU_BOTTOM_HEALTH_NAME",_loc1_);
               _loc3_ = Locale.loadStringEx("MENU_BOTTOM_HEALTH_DESCRIPTION",_loc1_);
               _loc4_ = 158;
               break;
            case 5:
               _loc2_ = Locale.loadStringEx("MENU_BOTTOM_ARMOR_NAME",_loc1_);
               _loc3_ = Locale.loadStringEx("MENU_BOTTOM_ARMOR_DESCRIPTION",_loc1_);
               _loc4_ = 85;
               break;
            case 6:
               _loc2_ = Locale.loadStringEx("MENU_BOTTOM_RESPAWN_NAME",_loc1_);
               _loc3_ = Locale.loadStringEx("MENU_BOTTOM_RESPAWN_DESCRIPTION",_loc1_);
               _loc4_ = 84;
               break;
            case 7:
               _loc2_ = Locale.loadStringEx("MENU_BOTTOM_ARMOR_ENEMY_NAME",_loc1_);
               _loc3_ = Locale.loadStringEx("MENU_BOTTOM_ARMOR_ENEMY_DESCRIPTION",_loc1_);
               _loc4_ = 87;
               break;
            case 8:
               _loc2_ = Locale.loadStringEx("MENU_BOTTOM_COST_NAME",_loc1_);
               _loc3_ = Locale.loadStringEx("MENU_BOTTOM_COST_DESCRIPTION",_loc1_);
               _loc4_ = 145;
               break;
            case 9:
               _loc2_ = Locale.loadStringEx("MENU_BOTTOM_HEALTH_SINGLE_NAME",_loc1_);
               _loc3_ = Locale.loadStringEx("MENU_BOTTOM_HEALTH_SINGLE_DESCRIPTION",_loc1_);
               _loc4_ = 75;
               break;
            case 10:
               _loc2_ = Locale.loadStringEx("MENU_BOTTOM_MAGIC_ARMOR_NAME",_loc1_);
               _loc3_ = Locale.loadStringEx("MENU_BOTTOM_MAGIC_ARMOR_DESCRIPTION",_loc1_);
               _loc4_ = 100;
         }
         var _loc5_:TooltipBasicMiddle = new TooltipBasicMiddle(this.tooltipPoint,this.tooltipPoint,_loc4_,{
            "title":_loc2_,
            "text":_loc3_
         });
         this.level.addToopTip(_loc5_);
      }
      
      private function destroyThis() : void
      {
         this.level = null;
         this.hit.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents);
         this.hit.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents);
         this.hit = null;
         this.parent.removeChild(this);
      }
   }
}

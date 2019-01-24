package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class RayArcane extends §_-LR§
   {
       
      
      private var §var§:Boolean;
      
      public function RayArcane(param1:Point, param2:Enemy, param3:Boolean)
      {
         super(param1,param2);
         this.§var§ = param3;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         if(this.§var§)
         {
            this.cRoot.game.gameSounds.playArcaneDesintegrateAttack();
         }
         else
         {
            this.cRoot.game.gameSounds.playArcaneAttack();
         }
         this.durationTime = 10;
         this.durationTimeCounter = 0;
         this.minDamage = this.cRoot.gameSettings.mages.arcane.minDamage;
         this.maxDamage = this.cRoot.gameSettings.mages.arcane.maxDamage;
         this.getDamage();
         this.§_-0Y§ = new §_-EQ§(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust));
         this.cRoot.bullets.addChild(this.§_-0Y§);
         this.§_-0W§();
      }
      
      override protected function hit() : void
      {
         var _loc1_:§_-27§ = null;
         var _loc2_:int = 0;
         if(this.§var§)
         {
            if(this.durationTimeCounter + 1 == this.durationTime)
            {
               this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"zaparcane"));
               MovieClip(this.target).desintegrate();
            }
         }
         else
         {
            _loc1_ = null;
            if(!this.shielded && this.cRoot.game.gameUpgrades.magesUpSlowCurse == true && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel == 5) && !this.target.hasDebuff("DebuffRage") && !this.target.hasDebuff("DebuffSlow"))
            {
               _loc1_ = new DebuffSlow(this.cRoot,1,this.target);
            }
            _loc2_ = this.damage / this.durationTime;
            if(this.durationTimeCounter + 1 == this.durationTime)
            {
               _loc2_ = _loc2_ + this.extraDamage;
            }
            this.target.setDamage(_loc2_,this.cRoot.gameSettings.M_ARMOR,_loc1_,0,this.shielded);
            if(!this.shielded && (this.cRoot.game.gameUpgrades.magesUpArcaneShatter && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 2)) && this.target != null && this.target.isActive)
            {
               this.target.setDamageArmor(this.cRoot.game.gameUpgrades.magesUpArcaneShatterDamage);
            }
            if(this.target != null && this.target.isDead)
            {
               this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"zaparcane"));
            }
            if(!this.shielded)
            {
               this.shielded = true;
            }
         }
      }
   }
}

package
{
   import flash.events.Event;
   import flash.geom.Point;
   
   public class BoltSorcerer extends Bolt
   {
       
      
      public function BoltSorcerer(param1:Point, param2:Enemy, param3:int)
      {
         addFrameScript(7,this.frame8,16,this.frame17);
         super(param1,param2,param3);
      }
      
      override protected function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playSorcererBolt();
         this.maxAceleration = 20;
         this.setLevelSettings();
         this.moveMe(true);
      }
      
      override protected function playPop() : void
      {
         if(this.target != null && this.target.isDead)
         {
            this.cRoot.bullets.addChild(new Pop(new Point(this.target.x + this.target.xAdjust,this.target.y + this.target.yAdjust),"zapsorcerer"));
         }
      }
      
      override protected function setLevelSettings() : void
      {
         this.minDamage = this.cRoot.gameSettings.mages.sorcerer.minDamage;
         this.maxDamage = this.cRoot.gameSettings.mages.sorcerer.maxDamage;
      }
      
      override protected function hitOnTarget() : void
      {
         var _loc1_:§_-27§ = null;
         if(this.cRoot.game.gameUpgrades.magesUpSlowCurse == true && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel == 5))
         {
            _loc1_ = new DebuffSlow(this.cRoot,1,this.target);
         }
         this.target.setDamage(this.getDamage(),this.cRoot.gameSettings.M_ARMOR,new DebuffCurse(this.cRoot,this.level,this.target));
         this.playPop();
         if(this.target != null && this.target.isActive && _loc1_ != null)
         {
            this.target.addDebuff(_loc1_);
         }
         if(this.cRoot.game.gameUpgrades.magesUpArcaneShatter && (this.cRoot.maxUpgradeLevel == 0 || this.cRoot.maxUpgradeLevel >= 2) && this.target != null && this.target.isActive)
         {
            this.target.setDamageArmor(this.cRoot.game.gameUpgrades.magesUpArcaneShatterDamage);
         }
         this.hit();
      }
      
      function frame8() : *
      {
         gotoAndPlay("travel");
      }
      
      function frame17() : *
      {
         stop();
      }
   }
}

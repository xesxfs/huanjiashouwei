package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class EnemySheepFlying extends EnemySheep
   {
       
      
      public var effect_Healing:MovieClip;
      
      public var debuff_Cursed:MovieClip;
      
      public var effect_Net:MovieClip;
      
      public var effect_TeslaHit:MovieClip;
      
      public var debuff_Poison:MovieClip;
      
      public var effect_Sniper:MovieClip;
      
      public function EnemySheepFlying(param1:int, param2:Array, param3:Number, param4:Number, param5:int, param6:int, param7:int, param8:int, param9:int, param10:Number)
      {
         addFrameScript(10,this.frame11,21,this.frame22,32,this.frame33,44,this.frame45,55,this.frame56);
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.xAdjust = 0;
         this.yAdjust = -36;
         this.isFlying = true;
         this.§_-NA§ = 20;
         this.§_-C-§ = 60;
         this.lifebarPosition = new Point(0,-52);
      }
      
      override public function explode() : void
      {
         this.setDeadBasicStatus();
         this.cRoot.entities.addChild(new EnemyExplodeAir(new Point(this.x,this.y),this.cRoot));
         this.destroyThis();
      }
      
      override public function desintegrate(param1:Boolean = true) : void
      {
         this.setDeadBasicStatus();
         this.cRoot.entities.addChild(new EnemyDesintegrateAir(new Point(this.x,this.y),this.cRoot,param1));
         this.destroyThis();
      }
      
      override public function pause() : void
      {
         this.stop();
         if(MovieClip(this.debuff_Cursed) != null)
         {
            this.debuff_Cursed.stop();
            this.debuff_Poison.stop();
            this.effect_TeslaHit.stop();
            this.effect_Sniper.stop();
            this.effect_Healing.stop();
         }
      }
      
      override public function unPauseEffects() : void
      {
         if(MovieClip(this.debuff_Cursed) != null)
         {
            if(MovieClip(this.debuff_Cursed).currentFrameLabel != "off")
            {
               MovieClip(this.debuff_Cursed).play();
            }
            else if(MovieClip(this.debuff_Cursed).currentFrameLabel == "onEnd")
            {
               MovieClip(this.debuff_Cursed).gotoAndPlay("on");
            }
            if(MovieClip(this.debuff_Poison).currentFrameLabel != "off")
            {
               MovieClip(this.debuff_Poison).play();
            }
            else if(MovieClip(this.debuff_Poison).currentFrameLabel == "onEnd")
            {
               MovieClip(this.debuff_Poison).gotoAndPlay("on");
            }
            if(MovieClip(this.effect_TeslaHit).currentFrameLabel != "off")
            {
               MovieClip(this.effect_TeslaHit).play();
            }
            if(MovieClip(this.effect_Sniper).currentFrameLabel != "off")
            {
               MovieClip(this.effect_Sniper).play();
            }
            if(MovieClip(this).effect_Healing.currentFrameLabel != "off")
            {
               MovieClip(this).effect_Healing.play();
            }
         }
      }
      
      override public function playDeadSound() : void
      {
         this.cRoot.game.gameSounds.playEnemyExploteSound();
      }
      
      function frame11() : *
      {
         gotoAndPlay("walking");
      }
      
      function frame22() : *
      {
         gotoAndPlay("walkingUp");
      }
      
      function frame33() : *
      {
         gotoAndPlay("walkingDown");
      }
      
      function frame45() : *
      {
         stop();
      }
      
      function frame56() : *
      {
         stop();
      }
   }
}

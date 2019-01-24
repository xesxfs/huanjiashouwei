package
{
   import com.reintroducing.sound.SoundManager;
   
   public class GameSounds
   {
       
      
      public var level:Level;
      
      public const §_-2U§:Number = 0.6;
      
      public const §_-AV§:Number = 0.6;
      
      public const §_-3d§:Number = 0.6;
      
      public const §_-0R§:Number = 0.6;
      
      public const §_-S4§:Number = 0.8;
      
      public const §_-Ho§:Number = 1;
      
      public const §_-Ps§:Number = 1;
      
      public const V_FX_GUI_SOUNDS_MEDIUM:Number = 0.6;
      
      public const V_FX_GUI_SOUNDS_LOW:Number = 0.4;
      
      public const §_-7p§:Number = 0.2;
      
      public const §_-2P§:Number = 0.4;
      
      public const V_FX_TOWER_UPGRADE:Number = 0.4;
      
      public const V_FX_TOWER_SELL:Number = 0.65;
      
      public const §_-S8§:Number = 0.44;
      
      public const §_-Mh§:Number = 0.9;
      
      public const §_-4S§:Number = 0.39;
      
      public const §_-OH§:Number = 0.54;
      
      public const §_-HJ§:Number = 0.7;
      
      public const §_-O5§:Number = 0.5;
      
      public const §_-FJ§:Number = 0.35;
      
      public const V_FX_TOWER_TAUNT_LOW:Number = 0.2;
      
      public const §_-Lh§:Number = 0.25;
      
      public const V_FX_TOWER_OPEN_DOOR:Number = 0.35;
      
      public const §_-5A§:Number = 0.9;
      
      public const §_-R-§:Number = 0.25;
      
      public const §_-0E§:Number = 0.2;
      
      public const §_-Tw§:Number = 0.4;
      
      public const §_-Ey§:Number = 0.7;
      
      public const §_-5p§:Number = 0.3;
      
      public const §_-72§:Number = 0.4;
      
      public const §_-FI§:Number = 0.7;
      
      public const §_-93§:Number = 1;
      
      public const §_-MH§:Number = 0.1;
      
      public const §_-0§:Number = 0.05;
      
      public const §_-2L§:Number = 0.4;
      
      public const §_-IZ§:Number = 0.45;
      
      public const §_-1f§:Number = 0.35;
      
      public const §_-S7§:Number = 0.46;
      
      public const §_-Pa§:Number = 0.1;
      
      public const §_-Nm§:Number = 0.15;
      
      public const §_-Jq§:Number = 0.45;
      
      public const §_-SZ§:Number = 0.35;
      
      public const §_-Nc§:Number = 0.28;
      
      public const §_-4J§:Number = 0.2;
      
      public const §_-8w§:Number = 0.1;
      
      public const §_-R4§:Number = 0.25;
      
      public const V_FX_COMMON_LOW:Number = 0.3;
      
      public const V_FX_COMMON_MEDIUM_LOW:Number = 0.4;
      
      public const V_FX_COMMON_MEDIUM:Number = 0.6;
      
      public const §_-1N§:Number = 1;
      
      public const §_-0d§:Number = 0.9;
      
      public const §_-TX§:Number = 0.9;
      
      public var §_-BI§:int;
      
      public const §_-PU§:Number = 0.8;
      
      public const §return§:Number = 0.8;
      
      private var hitIceActive:int = 1;
      
      private var §_-9y§:int = 45;
      
      private var §_-L6§:int;
      
      private var §_-C6§:int = 30;
      
      private var §_-KU§:int;
      
      private var bombShootMax:int = 3;
      
      private var bombShootCurrent:int = 0;
      
      private var bombMax:int = 3;
      
      private var bombCurrent:int = 0;
      
      private var axeMax:int = 4;
      
      private var axeCurrent:int = 0;
      
      private var §_-TG§:int = 4;
      
      private var §null §:int = 0;
      
      private var goblinDeadMax:int = 3;
      
      private var goblinDeadCurrent:int = 0;
      
      private var orcDeadMax:int = 3;
      
      private var orcDeadCurrent:int = 0;
      
      private var trollDeadMax:int = 3;
      
      private var trollDeadCurrent:int = 0;
      
      private var §_-9Y§:int = 3;
      
      private var §_-MX§:int = 0;
      
      private var skeletonDeadMax:int = 3;
      
      private var skeletonDeadCurrent:int = 0;
      
      private var §_-03§:int = 1;
      
      private var §_-Tz§:int = 45;
      
      private var §_-Hg§:int;
      
      private var §_-00§:int = 1;
      
      private var §_-1-§:int = 45;
      
      private var §_-JY§:int;
      
      private var §_-Ai§:int = 1;
      
      private var §_-20§:int;
      
      private var §get §:int;
      
      private var §_-K4§:int = 45;
      
      private var §_-Gx§:int;
      
      private var §_-Gz§:int = 1;
      
      private var §_-GU§:int = 45;
      
      private var §_-EF§:int;
      
      private var §_-5y§:int = 1;
      
      private var §_-9C§:int = 1;
      
      private var §_-B6§:int = 1;
      
      private var §_-3e§:int = 1;
      
      private var §_-5n§:int = 1;
      
      private var §_-CG§:int = 1;
      
      private var §_-RL§:int = 1;
      
      private var §_-0O§:int = 1;
      
      private var §_-EN§:int = 1;
      
      private var §_-8N§:int = 1;
      
      private var §_-Qo§:int = 1;
      
      private var §_-4V§:int = 1;
      
      private var §_-w§:int = 1;
      
      private var §_-IU§:int = 1;
      
      private var §_-Mr§:int = 1;
      
      private var §_-3x§:int = 1;
      
      private var §_-2a§:int = 1;
      
      private var §_-QL§:Boolean;
      
      private var §_-Si§:Boolean;
      
      private var §_-Sx§:int = 1;
      
      private var §_-T0§:int = 1;
      
      private var §_-FE§:int = 1;
      
      private var §_-13§:int = 1;
      
      private var §_-U0§:int = 1;
      
      private var §_-A7§:int = 1;
      
      private var §_-5x§:int = 1;
      
      private var §_-Ct§:int = 1;
      
      private var §_-Tp§:int = 1;
      
      private var §_-TD§:int = 1;
      
      private var §_-MG§:int = 1;
      
      private var §_-Aq§:int = 1;
      
      private var §_-3P§:int = 1;
      
      private var §_-KX§:int = 1;
      
      private var §_-Sb§:int = 1;
      
      private var §_-83§:int = 1;
      
      private var §_-5s§:int = 1;
      
      private var §_-OY§:int = 1;
      
      private var §_-Ka§:int = 1;
      
      private var §_-3-§:int = 1;
      
      private var §_-5X§:int = 1;
      
      private var §_-N2§:int = 1;
      
      private var §_-LO§:int = 1;
      
      private var §_-Om§:int = 1;
      
      private var §_-A2§:int = 1;
      
      private var §_-4g§:int = 1;
      
      private var §_-Qx§:int = 1;
      
      private var §_-25§:int = 1;
      
      private var §_-Fx§:int = 1;
      
      private var §_-7P§:int = 1;
      
      public function GameSounds()
      {
         super();
      }
      
      public function setLevel(param1:Level) : void
      {
         this.level = param1;
         this.§_-L6§ = 0;
         this.§_-KU§ = 0;
         this.bombShootCurrent = 0;
         this.bombCurrent = 0;
         this.axeCurrent = 0;
         this.§null § = 0;
         this.goblinDeadCurrent = 0;
         this.orcDeadCurrent = 0;
         this.trollDeadCurrent = 0;
         this.§_-MX§ = 0;
         this.skeletonDeadCurrent = 0;
      }
      
      public function unSetLevel() : void
      {
         this.level = null;
      }
      
      public function onFrameUpdate() : void
      {
         this.§_-Ro§();
         this.§_-OF§();
      }
      
      public function removeSound(param1:String) : void
      {
         if(SoundManager.getInstance().hasSound(param1))
         {
            SoundManager.getInstance().removeSound(param1);
         }
      }
      
      public function stopAllMusics() : void
      {
         SoundManager.getInstance().stopSound("music_main_menu");
         SoundManager.getInstance().stopSound("music_map");
         SoundManager.getInstance().stopSound("music_pre_battle");
         SoundManager.getInstance().stopSound("music_battle");
         SoundManager.getInstance().stopSound("music_boss_fight");
         SoundManager.getInstance().stopSound("music_battle_veznan");
         SoundManager.getInstance().stopSound("music_end_game");
      }
      
      public function §_-CS§() : void
      {
         switch(this.§_-BI§)
         {
            case 1:
               this.playMusicMain();
               break;
            case 2:
               this.§_-7C§();
               break;
            case 3:
               this.§_-84§();
               break;
            case 4:
               this.playMusicBattle();
               break;
            case 5:
               this.playMusicBossFight();
               break;
            case 6:
               this.playMusicBattleVeznan();
               break;
            case 7:
               this.§_-1z§();
         }
      }
      
      public function playMusicMain() : void
      {
         this.stopAllMusics();
         SoundManager.getInstance().playSound("music_main_menu",this.§_-2U§,0,9999);
         this.§_-BI§ = 1;
      }
      
      public function §_-7C§() : void
      {
         this.stopAllMusics();
         SoundManager.getInstance().playSound("music_map",this.§_-AV§,0,9999);
         this.§_-BI§ = 2;
      }
      
      public function §_-84§() : void
      {
         this.stopAllMusics();
         SoundManager.getInstance().playSound("music_pre_battle",this.§_-3d§,0,9999);
         this.§_-BI§ = 3;
      }
      
      public function playMusicBattle() : void
      {
         this.stopAllMusics();
         SoundManager.getInstance().playSound("music_battle",this.§_-0R§,0,9999);
         this.§_-BI§ = 4;
      }
      
      public function playMusicBossFight() : void
      {
         this.stopAllMusics();
         SoundManager.getInstance().playSound("music_boss_fight",this.§_-0R§,0,9999);
         this.§_-BI§ = 5;
      }
      
      public function playMusicBattleVeznan() : void
      {
         this.stopAllMusics();
         SoundManager.getInstance().playSound("music_battle_veznan",this.§_-0R§,0,9999);
         this.§_-BI§ = 6;
      }
      
      public function §_-1z§() : void
      {
         this.stopAllMusics();
         SoundManager.getInstance().playSound("music_end_game",this.§_-0R§,0,9999);
         this.§_-BI§ = 7;
      }
      
      public function fadeMusicCredits() : void
      {
         SoundManager.getInstance().fadeSound("music_end_game",0,3,true);
      }
      
      public function §_-JE§() : void
      {
         this.stopAllMusics();
         SoundManager.getInstance().playSound("music_suspense",this.§_-S4§,0,1);
      }
      
      public function §_-0T§() : void
      {
         SoundManager.getInstance().playSound("gui_quest_completed",this.§_-Ho§,0,0);
      }
      
      public function §_-Pr§(param1:String) : void
      {
         SoundManager.getInstance().playSound("gui_win_stars" + param1,this.§_-Ho§,0,0);
      }
      
      public function §_-Sp§() : void
      {
         SoundManager.getInstance().playSound("gui_victory_cheer",this.§_-Ho§,0,0);
      }
      
      public function §_-4w§() : void
      {
         SoundManager.getInstance().playSound("gui_map_new_flag",this.§_-Ho§,0,0);
      }
      
      public function §_-5q§() : void
      {
         SoundManager.getInstance().playSound("gui_map_road",this.V_FX_GUI_SOUNDS_LOW,0,0);
      }
      
      public function §_-Aw§() : void
      {
         SoundManager.getInstance().playSound("gui_next_wave_ready",this.§_-Ho§,0,0);
      }
      
      public function §_-Bv§() : void
      {
         SoundManager.getInstance().playSound("gui_next_wave_reward",this.§_-Ho§,0,0);
      }
      
      public function playGUILooseLife() : void
      {
         switch(this.§_-Qo§)
         {
            case 1:
               SoundManager.getInstance().playSound("gui_loose_life1",this.§_-Ho§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("gui_loose_life2",this.§_-Ho§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("gui_loose_life3",this.§_-Ho§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("gui_loose_life4",this.§_-Ho§,0,0);
         }
         this.§_-Qo§++;
         if(this.§_-Qo§ > 4)
         {
            this.§_-Qo§ = 1;
         }
      }
      
      public function §_-3t§() : void
      {
         SoundManager.getInstance().playSound("gui_quest_failed",this.§_-Ho§,0,0);
      }
      
      public function §_-6m§() : void
      {
         SoundManager.getInstance().playSound("gui_spell_refresh",this.V_FX_GUI_SOUNDS_MEDIUM,0,0);
      }
      
      public function §_-2d§() : void
      {
         SoundManager.getInstance().playSound("gui_spell_select",this.V_FX_GUI_SOUNDS_MEDIUM,0,0);
      }
      
      public function stopSound(param1:String) : void
      {
         SoundManager.getInstance().stopSound(param1);
      }
      
      public function playGUIButtonCommon() : void
      {
         SoundManager.getInstance().stopSound("gui_button_common");
         SoundManager.getInstance().playSound("gui_button_common",this.V_FX_GUI_SOUNDS_MEDIUM,0,0);
      }
      
      public function playShowHideMenues() : void
      {
         SoundManager.getInstance().stopSound("gui_show_hide_menues");
         SoundManager.getInstance().playSound("gui_show_hide_menues",this.§_-7p§,0,0);
      }
      
      public function playGUIBuyUpgrade() : void
      {
         SoundManager.getInstance().playSound("gui_buy_upgrade",this.§_-7p§,0,0);
      }
      
      public function stopGUIMouseOverCommon() : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
      }
      
      public function playGUIMouseOverCommon() : void
      {
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",this.V_FX_GUI_SOUNDS_LOW,0,0);
      }
      
      public function §_-Dh§() : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_tower_common");
         SoundManager.getInstance().playSound("gui_mouse_over_tower_common",this.V_FX_GUI_SOUNDS_MEDIUM,0,0);
      }
      
      public function §_-H2§() : void
      {
         SoundManager.getInstance().stopSound("gui_mouse_over_metallic");
         SoundManager.getInstance().playSound("gui_mouse_over_metallic",this.§_-Ho§,0,0);
      }
      
      public function §_-DF§() : void
      {
         SoundManager.getInstance().playSound("gui_open_tower_menu",this.§_-Ho§,0,0);
      }
      
      public function §_-10§() : void
      {
         SoundManager.getInstance().playSound("gui_transition_door",this.V_FX_GUI_SOUNDS_LOW,0,0);
      }
      
      public function §_-E§() : void
      {
         SoundManager.getInstance().playSound("gui_achievement_win",this.V_FX_GUI_SOUNDS_MEDIUM,0,0);
      }
      
      public function playGUINotificationPopup() : void
      {
         SoundManager.getInstance().playSound("gui_notification_popup",this.V_FX_GUI_SOUNDS_LOW,0,0);
      }
      
      public function playGUINotificationOpen() : void
      {
         SoundManager.getInstance().playSound("gui_notification_open",this.§_-Ho§,0,0);
      }
      
      public function §_-Ie§() : void
      {
         SoundManager.getInstance().playSound("gui_notification_close",this.§_-Ho§,0,0);
      }
      
      public function playGUINotificationOver() : void
      {
         SoundManager.getInstance().stopSound("gui_notification_over");
         SoundManager.getInstance().playSound("gui_notification_over",this.V_FX_GUI_SOUNDS_MEDIUM,0,0);
      }
      
      public function playGUINotificationOver2() : void
      {
         SoundManager.getInstance().stopSound("gui_notification_over2");
         SoundManager.getInstance().playSound("gui_notification_over2",this.V_FX_GUI_SOUNDS_MEDIUM,0,0);
      }
      
      public function §_-4l§() : void
      {
         SoundManager.getInstance().stopSound("gui_rally_point_placed");
         SoundManager.getInstance().playSound("gui_rally_point_placed",this.V_FX_GUI_SOUNDS_LOW,0,0);
      }
      
      public function §_-PK§() : void
      {
         var _loc1_:Number = this.getArrowSound();
         this.§_-Sx§++;
         SoundManager.getInstance().playSound("arrow_pool_" + this.§_-Sx§,_loc1_,0,0);
         if(this.§_-Sx§ >= 6)
         {
            this.§_-Sx§ = 1;
         }
      }
      
      public function §_-3o§() : void
      {
         var _loc1_:Number = this.getShotgunSound();
         this.§_-FE§++;
         SoundManager.getInstance().playSound("shootgun_pool_" + this.§_-FE§,_loc1_,0,0);
         if(this.§_-FE§ >= 4)
         {
            this.§_-FE§ = 1;
         }
      }
      
      public function §_-N7§() : void
      {
         this.§_-13§++;
         SoundManager.getInstance().playSound("sniper_pool_" + this.§_-13§,this.§_-OH§,0,0);
         if(this.§_-13§ >= 4)
         {
            this.§_-13§ = 1;
         }
      }
      
      public function playBombSound() : void
      {
         this.§_-U0§++;
         SoundManager.getInstance().playSound("bomb_pool_" + this.§_-U0§,this.§_-Jq§,0,0);
         if(this.§_-U0§ >= 4)
         {
            this.§_-U0§ = 1;
         }
      }
      
      public function playBombShootSound() : void
      {
         this.§_-A7§++;
         SoundManager.getInstance().playSound("bomb_shoot_pool_" + this.§_-A7§,this.§_-SZ§,0,0);
         if(this.§_-A7§ >= 4)
         {
            this.§_-A7§ = 1;
         }
      }
      
      public function playBolt() : void
      {
         this.§_-Ct§++;
         SoundManager.getInstance().playSound("bolt_pool_" + this.§_-Ct§,this.§_-Nc§,0,0);
         if(this.§_-Ct§ >= 4)
         {
            this.§_-Ct§ = 1;
         }
      }
      
      public function playSorcererBolt() : void
      {
         this.§_-Tp§++;
         SoundManager.getInstance().playSound("bolt_sorcerer_pool_" + this.§_-Tp§,this.§_-Nc§,0,0);
         if(this.§_-Tp§ >= 4)
         {
            this.§_-Tp§ = 1;
         }
      }
      
      public function §_-HH§() : void
      {
         this.§_-Aq§++;
         SoundManager.getInstance().playSound("ray_polymorph_pool_" + this.§_-Aq§,this.§_-O5§,0,0);
         if(this.§_-Aq§ >= 4)
         {
            this.§_-Aq§ = 1;
         }
      }
      
      public function playArcaneAttack() : void
      {
         this.§_-TD§++;
         SoundManager.getInstance().playSound("ray_arcane_pool_" + this.§_-TD§,this.§_-Nc§,0,0);
         if(this.§_-TD§ >= 4)
         {
            this.§_-TD§ = 1;
         }
      }
      
      public function playArcaneDesintegrateAttack() : void
      {
         this.§_-MG§++;
         SoundManager.getInstance().playSound("ray_arcane_desintegrate_pool_" + this.§_-MG§,this.§_-HJ§,0,0);
         if(this.§_-MG§ >= 4)
         {
            this.§_-MG§ = 1;
         }
      }
      
      public function playArcaneTeleportAttack(param1:String) : void
      {
         this.§_-N2§++;
         SoundManager.getInstance().playSound("teleporth_pool_" + this.§_-N2§,this.§_-S8§,0,0);
         if(this.§_-N2§ >= 4)
         {
            this.§_-N2§ = 1;
         }
      }
      
      public function §_-Jn§(param1:String) : void
      {
         this.§_-LO§++;
         SoundManager.getInstance().playSound("thorn_pool_" + this.§_-LO§,this.§_-4S§,0,0);
         if(this.§_-LO§ >= 4)
         {
            this.§_-LO§ = 1;
         }
      }
      
      public function playPaladinHealingEffect(param1:String) : void
      {
         this.§_-Om§++;
         SoundManager.getInstance().playSound("paladin_heal_pool_" + this.§_-Om§,this.§_-Mh§,0,0);
         if(this.§_-Om§ >= 4)
         {
            this.§_-Om§ = 1;
         }
      }
      
      public function §_-FD§() : void
      {
         this.§_-5x§++;
         SoundManager.getInstance().playSound("rocket_launch_pool_" + this.§_-5x§,this.§_-S8§,0,0);
         if(this.§_-5x§ >= 4)
         {
            this.§_-5x§ = 1;
         }
      }
      
      public function §_-BY§(param1:String) : void
      {
         this.§_-A2§++;
         SoundManager.getInstance().playSound("shrapnel_pool_" + this.§_-A2§,this.§_-S8§,0,0);
         if(this.§_-A2§ >= 4)
         {
            this.§_-A2§ = 1;
         }
      }
      
      public function wolfAttack() : void
      {
         if(this.§_-L6§ >= this.§_-9y§)
         {
            if(Math.random() > 0.5)
            {
               SoundManager.getInstance().playSound("attack_wolf",this.§_-R-§,0,0);
            }
            else
            {
               SoundManager.getInstance().playSound("attack_wolf2",this.§_-R-§,0,0);
            }
            this.§_-L6§ = 0;
         }
      }
      
      public function spiderAttack() : void
      {
         if(this.§_-KU§ >= this.§_-C6§)
         {
            if(Math.random() > 0.5)
            {
               SoundManager.getInstance().playSound("attack_spider",this.§_-R-§,0,0);
            }
            else
            {
               SoundManager.getInstance().playSound("attack_spider2",this.§_-R-§,0,0);
            }
            this.§_-KU§ = 0;
         }
      }
      
      public function §_-5o§() : void
      {
         this.§_-4g§++;
         SoundManager.getInstance().playSound("area_attack_pool_" + this.§_-4g§,this.§_-R-§,0,0);
         if(this.§_-4g§ >= 4)
         {
            this.§_-4g§ = 1;
         }
      }
      
      public function rocketeerSpecial() : void
      {
         this.§_-Qx§++;
         SoundManager.getInstance().playSound("rocketeer_pool_" + this.§_-Qx§,this.§_-R-§,0,0);
         if(this.§_-Qx§ >= 4)
         {
            this.§_-Qx§ = 1;
         }
      }
      
      public function enemyHealing() : void
      {
         this.§_-25§++;
         SoundManager.getInstance().playSound("enemy_healing_pool_" + this.§_-25§,this.§_-R-§,0,0);
         if(this.§_-25§ >= 4)
         {
            this.§_-25§ = 1;
         }
      }
      
      public function trollRage() : void
      {
         this.§_-Fx§++;
         SoundManager.getInstance().playSound("rage_pool_" + this.§_-Fx§,this.§_-R-§,0,0);
         if(this.§_-Fx§ >= 4)
         {
            this.§_-Fx§ = 1;
         }
      }
      
      public function playEnemyBigDead() : void
      {
         this.§_-Sb§++;
         SoundManager.getInstance().playSound("death_big_pool_" + this.§_-Sb§,this.§_-0E§,0,0);
         if(this.§_-Sb§ >= 3)
         {
            this.§_-Sb§ = 1;
         }
      }
      
      public function playEnemyPuffDead() : void
      {
         this.§_-KX§++;
         SoundManager.getInstance().playSound("death_puff_pool_" + this.§_-KX§,this.§_-Tw§,0,0);
         if(this.§_-KX§ >= 4)
         {
            this.§_-KX§ = 1;
         }
      }
      
      public function playEnemyPuffDeadHighest() : void
      {
         this.§_-KX§++;
         SoundManager.getInstance().playSound("death_puff_pool_" + this.§_-KX§,this.§_-Ey§,0,0);
         if(this.§_-KX§ >= 4)
         {
            this.§_-KX§ = 1;
         }
      }
      
      public function playEnemyExploteSound() : void
      {
         this.§_-3P§++;
         SoundManager.getInstance().playSound("death_explode_pool_" + this.§_-3P§,this.§_-MH§,0,0);
         if(this.§_-3P§ >= 4)
         {
            this.§_-3P§ = 1;
         }
      }
      
      public function playEnemyGoblinDeadSound() : void
      {
         this.§_-3-§++;
         SoundManager.getInstance().playSound("death_goblin_pool_" + this.§_-3-§,this.§_-Tw§,0,0);
         if(this.§_-3-§ >= 4)
         {
            this.§_-3-§ = 1;
         }
      }
      
      public function playEnemyOrcDeadSound() : void
      {
         this.§_-83§++;
         SoundManager.getInstance().playSound("death_orc_pool_" + this.§_-83§,this.§_-0E§,0,0);
         if(this.§_-83§ >= 4)
         {
            this.§_-83§ = 1;
         }
      }
      
      public function playEnemyTrollDeadSound() : void
      {
         this.§_-Ka§++;
         SoundManager.getInstance().playSound("death_troll_pool_" + this.§_-Ka§,this.§_-Tw§,0,0);
         if(this.§_-Ka§ >= 4)
         {
            this.§_-Ka§ = 1;
         }
      }
      
      public function playEnemyHumanDeadSound() : void
      {
         var _loc1_:Number = this.getHumanDeadSound();
         this.§_-5s§++;
         SoundManager.getInstance().playSound("death_human_pool_" + this.§_-5s§,_loc1_,0,0);
         if(this.§_-5s§ >= 10)
         {
            this.§_-5s§ = 1;
         }
      }
      
      public function playSkeletonDeadSound() : void
      {
         var _loc1_:Number = this.getSkeletonDeadSound();
         this.§_-OY§++;
         SoundManager.getInstance().playSound("death_skeleton_pool_" + this.§_-OY§,_loc1_,0,0);
         if(this.§_-OY§ >= 4)
         {
            this.§_-OY§ = 1;
         }
      }
      
      public function getShotgunSound() : Number
      {
         var _loc1_:Number = Math.random() + this.§_-1f§;
         if(_loc1_ > this.§_-S7§)
         {
            _loc1_ = this.§_-S7§;
         }
         return _loc1_;
      }
      
      public function getArrowSound() : Number
      {
         var _loc1_:Number = Math.random() + this.§_-2L§;
         if(_loc1_ > this.§_-IZ§)
         {
            _loc1_ = this.§_-IZ§;
         }
         return _loc1_;
      }
      
      public function getAxeSound() : Number
      {
         var _loc1_:Number = Math.random() + this.§_-Pa§;
         if(_loc1_ > this.§_-Nm§)
         {
            _loc1_ = this.§_-Nm§;
         }
         return _loc1_;
      }
      
      public function getHumanDeadSound() : Number
      {
         var _loc1_:Number = Math.random() + this.§_-5p§;
         if(_loc1_ > this.§_-72§)
         {
            _loc1_ = this.§_-72§;
         }
         return _loc1_;
      }
      
      public function getSkeletonDeadSound() : Number
      {
         var _loc1_:Number = Math.random() + this.§_-FI§;
         if(_loc1_ > this.§_-93§)
         {
            _loc1_ = this.§_-93§;
         }
         return _loc1_;
      }
      
      private function §_-Ro§() : void
      {
         this.§_-L6§++;
         this.§_-KU§++;
         this.§_-Hg§++;
         this.§_-JY§++;
         this.§get §++;
         this.§_-Gx§++;
         this.§_-EF§++;
      }
      
      private function §_-OF§() : void
      {
         var _loc3_:Soldier = null;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = SoundManager.getInstance().isSoundSoldierFighting();
         for each(_loc3_ in this.level.soldiers)
         {
            if(!_loc3_.isDead && !_loc3_.isWalking && _loc3_.isFighting)
            {
               _loc1_ = true;
               break;
            }
         }
         if(_loc1_)
         {
            if(!_loc2_)
            {
               SoundManager.getInstance().playSound("soldier_fight_1",this.§_-R-§,0,99999);
               SoundManager.getInstance().setPlayingSwords(true);
            }
         }
         else if(_loc2_)
         {
            SoundManager.getInstance().stopSound("soldier_fight_1");
            SoundManager.getInstance().setPlayingSwords(false);
         }
      }
      
      public function playAxeSound() : void
      {
         this.§_-T0§++;
         SoundManager.getInstance().playSound("axe_pool_" + this.§_-T0§,this.getAxeSound(),0,0);
         if(this.§_-T0§ >= 4)
         {
            this.§_-T0§ = 1;
         }
      }
      
      public function playArcherTaunt() : void
      {
         if(this.§_-Hg§ < this.§_-Tz§)
         {
            return;
         }
         switch(this.§_-03§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_archer_ready",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_archer_taunt1",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tower_archer_taunt2",this.§_-Lh§,0,0);
         }
         this.§_-03§++;
         this.§_-Hg§ = 0;
         if(this.§_-03§ > 3)
         {
            this.§_-03§ = 1;
         }
      }
      
      public function playEngineerTaunt() : void
      {
         if(this.§_-JY§ < this.§_-1-§)
         {
            return;
         }
         switch(this.§_-00§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_engineer_ready",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_engineer_taunt1",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tower_engineer_taunt2",this.§_-Lh§,0,0);
         }
         this.§_-00§++;
         this.§_-JY§ = 0;
         if(this.§_-00§ > 3)
         {
            this.§_-00§ = 1;
         }
      }
      
      public function playMageTaunt() : void
      {
         if(this.§get § < this.§_-1-§)
         {
            return;
         }
         switch(this.§_-Ai§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_mage_ready",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_mage_taunt1",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tower_mage_taunt2",this.§_-Lh§,0,0);
         }
         this.§_-Ai§++;
         this.§get § = 0;
         if(this.§_-Ai§ > 3)
         {
            this.§_-Ai§ = 1;
         }
      }
      
      public function playSoldierTaunt() : void
      {
         if(this.§_-Gx§ < this.§_-K4§)
         {
            return;
         }
         switch(this.§_-CG§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_soldier_ready",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_soldier_taunt1",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tower_soldier_taunt2",this.§_-Lh§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("tower_soldier_move",this.§_-Lh§,0,0);
         }
         this.§_-CG§++;
         this.§_-Gx§ = 0;
         if(this.§_-CG§ > 4)
         {
            this.§_-CG§ = 1;
         }
      }
      
      public function playBarbarianTaunt() : void
      {
         switch(this.§_-RL§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_soldier_barbarian_ready",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_soldier_barbarian_taunt1",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tower_soldier_barbarian_taunt2",this.§_-Lh§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("tower_soldier_barbarian_move",this.§_-Lh§,0,0);
         }
         this.§_-RL§++;
         if(this.§_-RL§ > 4)
         {
            this.§_-RL§ = 1;
         }
      }
      
      public function playBarbarianNetTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_soldier_barbarian_taunt1",this.§_-Lh§,0,0);
      }
      
      public function playBarbarianDoubleAxesTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_soldier_barbarian_move",this.§_-Lh§,0,0);
      }
      
      public function playBarbarianTrowingAxesTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_soldier_barbarian_ready",this.§_-Lh§,0,0);
      }
      
      public function playPaladinTaunt() : void
      {
         switch(this.§_-0O§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_soldier_paladin_ready",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_soldier_paladin_taunt1",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tower_soldier_paladin_taunt2",this.§_-Lh§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("tower_soldier_paladin_move",this.§_-Lh§,0,0);
         }
         this.§_-0O§++;
         if(this.§_-0O§ > 4)
         {
            this.§_-0O§ = 1;
         }
      }
      
      public function playPaladinHolyStrikeTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_soldier_paladin_taunt1",this.§_-Lh§,0,0);
      }
      
      public function playPaladinHealingTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_soldier_paladin_ready",this.§_-Lh§,0,0);
      }
      
      public function playPaladinShieldTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_soldier_paladin_taunt2",this.§_-Lh§,0,0);
      }
      
      public function playSasquashReady() : void
      {
         SoundManager.getInstance().playSound("tower_soldier_sasquash_ready",this.§_-Lh§,0,0);
      }
      
      public function playSasquashRally() : void
      {
         SoundManager.getInstance().playSound("tower_soldier_sasquash_rally",this.§_-Lh§,0,0);
      }
      
      public function playElementalDead() : void
      {
         this.§_-5X§++;
         SoundManager.getInstance().playSound("death_elemental_pool_" + this.§_-5X§,this.§_-0E§,0,0);
         if(this.§_-5X§ >= 3)
         {
            this.§_-5X§ = 1;
         }
      }
      
      public function playElementalRally() : void
      {
         SoundManager.getInstance().playSound("tower_mage_sorcerer_elemental_rally",this.§_-Lh§,0,0);
      }
      
      public function playRangerTaunt() : void
      {
         switch(this.§_-B6§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_archer_ranger_ready",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_archer_ranger_taunt1",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tower_archer_ranger_taunt2",this.§_-Lh§,0,0);
         }
         this.§_-B6§++;
         if(this.§_-B6§ > 3)
         {
            this.§_-B6§ = 1;
         }
      }
      
      public function playRangerThornsTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_archer_ranger_taunt2",this.§_-Lh§,0,0);
      }
      
      public function playRangerPoisonTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_archer_ranger_taunt1",this.§_-Lh§,0,0);
      }
      
      public function playMusketeerTaunt() : void
      {
         switch(this.§_-3e§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_archer_musketeer_ready",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_archer_musketeer_taunt1",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tower_archer_musketeer_taunt2",this.§_-Lh§,0,0);
         }
         this.§_-3e§++;
         if(this.§_-3e§ > 3)
         {
            this.§_-3e§ = 1;
         }
      }
      
      public function playMusketeerSniperTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_archer_musketeer_sniper",this.§_-Lh§,0,0);
      }
      
      public function playMusketeerShrapnelTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_archer_musketeer_taunt1",this.§_-Lh§,0,0);
      }
      
      public function playSorcererTaunt() : void
      {
         switch(this.§_-5n§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_mage_sorcerer_ready",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_mage_sorcerer_taunt1",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tower_mage_sorcerer_taunt2",this.§_-Lh§,0,0);
         }
         this.§_-5n§++;
         if(this.§_-5n§ > 3)
         {
            this.§_-5n§ = 1;
         }
      }
      
      public function playSorcererAshestoAshesTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_mage_sorcerer_taunt2",this.§_-Lh§,0,0);
      }
      
      public function §_-8z§() : void
      {
         SoundManager.getInstance().playSound("sheep",this.V_FX_TOWER_TAUNT_LOW,0,0);
      }
      
      public function playSorcererSheep() : void
      {
         SoundManager.getInstance().playSound("sheep",this.§_-Lh§,0,0);
      }
      
      public function playArcaneTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_mage_arcane_ready",this.§_-Lh§,0,0);
      }
      
      public function playArcaneTeleport() : void
      {
         SoundManager.getInstance().playSound("tower_mage_arcane_teleport",this.§_-Lh§,0,0);
      }
      
      public function playArcaneDesintegrate() : void
      {
         SoundManager.getInstance().playSound("tower_mage_arcane_desintegrate",this.§_-Lh§,0,0);
      }
      
      public function playTeslaTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_engineer_tesla_ready",this.§_-Lh§,0,0);
      }
      
      public function playTeslaOvercharge() : void
      {
         SoundManager.getInstance().playSound("tower_engineer_tesla_overcharge",this.§_-Lh§,0,0);
      }
      
      public function playTeslaChargedBolt() : void
      {
         switch(this.§_-w§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_engineer_tesla_charged_bolt",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_engineer_tesla_charged_bolt2",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tower_engineer_tesla_charged_bolt3",this.§_-Lh§,0,0);
         }
         this.§_-w§++;
         if(this.§_-w§ > 3)
         {
            this.§_-w§ = 1;
         }
      }
      
      public function playTeslaAttack() : void
      {
         switch(this.§_-4V§)
         {
            case 1:
               SoundManager.getInstance().playSound("tesla_attack_1",this.§_-R4§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tesla_attack_2",this.§_-R4§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("tesla_attack_3",this.§_-R4§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("tesla_attack_4",this.§_-R4§,0,0);
         }
         this.§_-4V§++;
         if(this.§_-4V§ > 4)
         {
            this.§_-4V§ = 1;
         }
      }
      
      public function playBfgTaunt() : void
      {
         SoundManager.getInstance().playSound("tower_engineer_bfg_ready",this.§_-Lh§,0,0);
      }
      
      public function playBfgMissile() : void
      {
         SoundManager.getInstance().playSound("tower_engineer_bfg_missile",this.§_-Lh§,0,0);
      }
      
      public function playBfgClsuter() : void
      {
         SoundManager.getInstance().playSound("tower_engineer_bfg_cluster",this.§_-Lh§,0,0);
      }
      
      public function playReinforcementTaunt() : void
      {
         switch(this.§_-EN§)
         {
            case 1:
               SoundManager.getInstance().playSound("reinforcement_event1",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("reinforcement_event2",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("reinforcement_event3",this.§_-Lh§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("reinforcement_event4",this.§_-Lh§,0,0);
         }
         this.§_-EN§++;
         if(this.§_-EN§ > 4)
         {
            this.§_-EN§ = 1;
         }
      }
      
      public function playElfTaunt() : void
      {
         switch(this.§_-8N§)
         {
            case 1:
               SoundManager.getInstance().playSound("tower_soldier_elf_taunt1",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("tower_soldier_elf_taunt2",this.§_-Lh§,0,0);
         }
         this.§_-8N§++;
         if(this.§_-8N§ > 2)
         {
            this.§_-8N§ = 1;
         }
      }
      
      public function playJuggernautDeath() : void
      {
         SoundManager.getInstance().playSound("juggernaut_death",this.§_-PU§,0,0);
      }
      
      public function playJtAttack() : void
      {
         SoundManager.getInstance().playSound("jt_attack",this.§_-PU§,0,0);
      }
      
      public function playJtEat() : void
      {
         SoundManager.getInstance().playSound("jt_eat",this.§_-PU§,0,0);
      }
      
      public function playJtRest() : void
      {
         SoundManager.getInstance().playSound("jt_rest",this.§_-PU§,0,0);
      }
      
      public function playJtDeath() : void
      {
         SoundManager.getInstance().playSound("jt_death",this.§_-PU§,0,0);
      }
      
      public function §_-I2§() : void
      {
         SoundManager.getInstance().playSound("jt_explode",this.§_-PU§,0,0);
      }
      
      public function §_-k§() : void
      {
         switch(this.hitIceActive)
         {
            case 1:
               SoundManager.getInstance().playSound("jt_hit_ice1",this.§_-PU§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("jt_hit_ice2",this.§_-PU§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("jt_hit_ice3",this.§_-PU§,0,0);
         }
         this.hitIceActive++;
         if(this.hitIceActive > 3)
         {
            this.hitIceActive = 1;
         }
      }
      
      public function playSoundBreakIce() : void
      {
         this.§_-7P§++;
         SoundManager.getInstance().playSound("break_ice_pool_" + this.§_-7P§,this.§_-PU§,0,0);
         if(this.§_-7P§ >= 4)
         {
            this.§_-7P§ = 1;
         }
      }
      
      public function playVeznanPortalSummon() : void
      {
         SoundManager.getInstance().playSound("veznan_portals_summon",this.§return§,0,0);
      }
      
      public function playVeznanPortalTeleportIn() : void
      {
         switch(this.§_-IU§)
         {
            case 1:
               SoundManager.getInstance().playSound("veznan_portals_teleport_in_1",this.§return§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("veznan_portals_teleport_in_2",this.§return§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("veznan_portals_teleport_in_3",this.§return§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("veznan_portals_teleport_in_4",this.§return§,0,0);
         }
         this.§_-IU§++;
         if(this.§_-IU§ > 4)
         {
            this.§_-IU§ = 1;
         }
      }
      
      public function playVeznanHoldCast() : void
      {
         SoundManager.getInstance().playSound("veznan_hold_cast",this.§return§,0,0);
      }
      
      public function §_-Jb§() : void
      {
         if(this.§_-QL§)
         {
            return;
         }
         SoundManager.getInstance().playSound("veznan_hold_hum",this.§return§,0,0);
         this.§_-QL§ = true;
      }
      
      public function §_-7f§() : void
      {
         SoundManager.getInstance().stopSound("veznan_hold_hum");
         this.§_-QL§ = false;
      }
      
      public function §_-Fz§() : void
      {
         if(this.§_-Si§)
         {
            return;
         }
         SoundManager.getInstance().playSound("veznan_hold_trap",this.§return§,0,0);
         this.§_-Si§ = true;
      }
      
      public function §_-81§() : void
      {
         SoundManager.getInstance().stopSound("veznan_hold_trap");
         this.§_-Si§ = false;
      }
      
      public function playVeznanToDemon() : void
      {
         SoundManager.getInstance().playSound("veznan_to_demon",this.§return§,0,0);
      }
      
      public function playVeznanTsung() : void
      {
         SoundManager.getInstance().playSound("veznan_tsung",this.§return§,0,0);
      }
      
      public function playVeznanDemonFire() : void
      {
         SoundManager.getInstance().playSound("veznan_demon_fire",this.§return§,0,0);
      }
      
      public function stopVeznanDemonFire() : void
      {
         SoundManager.getInstance().stopSound("veznan_demon_fire");
      }
      
      public function playVeznanDeath() : void
      {
         SoundManager.getInstance().playSound("veznan_death",this.§return§,0,0);
      }
      
      public function playVeznanAreaAttack() : void
      {
         this.§_-2a§++;
         SoundManager.getInstance().playSound("veznan_area_attack_" + this.§_-2a§,this.§return§,0,0);
         if(this.§_-2a§ >= 2)
         {
            this.§_-2a§ = 1;
         }
      }
      
      public function §_-1b§() : void
      {
         switch(this.§_-3x§)
         {
            case 1:
               SoundManager.getInstance().playSound("veznan_hold_hit_1",this.§return§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("veznan_hold_hit_2",this.§return§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("veznan_hold_hit_3",this.§return§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("veznan_hold_hit_4",this.§return§,0,0);
         }
         this.§_-3x§++;
         if(this.§_-3x§ > 4)
         {
            this.§_-3x§ = 1;
         }
      }
      
      public function §_-AK§() : void
      {
         switch(this.§_-Mr§)
         {
            case 1:
               SoundManager.getInstance().playSound("veznan_hold_dissipate_1",this.§return§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("veznan_hold_dissipate_2",this.§return§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("veznan_hold_dissipate_3",this.§return§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("veznan_hold_dissipate_4",this.§return§,0,0);
         }
         this.§_-Mr§++;
         if(this.§_-Mr§ > 4)
         {
            this.§_-Mr§ = 1;
         }
      }
      
      public function §_-Cq§() : void
      {
         SoundManager.getInstance().playSound("pc_gnome_cash",this.§_-0d§,0,0);
      }
      
      public function §_-Eh§() : void
      {
         SoundManager.getInstance().playSound("pc_thunder",this.§_-TX§,0,0);
      }
      
      public function playHeroLevelUp() : void
      {
         SoundManager.getInstance().playSound("hero_level_up",this.V_FX_COMMON_MEDIUM,0,0);
      }
      
      public function §_-KK§() : void
      {
         if(this.§_-EF§ < this.§_-GU§)
         {
            return;
         }
         switch(this.§_-Gz§)
         {
            case 1:
               SoundManager.getInstance().playSound("hero_gerald_1",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("hero_gerald_2",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("hero_gerald_3",this.§_-Lh§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("hero_gerald_4",this.§_-Lh§,0,0);
         }
         this.§_-Gz§++;
         this.§_-EF§ = 0;
         if(this.§_-Gz§ > 4)
         {
            this.§_-Gz§ = 1;
         }
      }
      
      public function playHeroGeraldDeath() : void
      {
         SoundManager.getInstance().playSound("hero_gerald_death",this.§_-Lh§,0,0);
      }
      
      public function playHeroGeraldDeflect() : void
      {
         SoundManager.getInstance().playSound("hero_gerald_deflect",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroGeraldCourage() : void
      {
         SoundManager.getInstance().playSound("hero_gerald_buff",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function §_-Ia§() : void
      {
         SoundManager.getInstance().playSound("hero_gerald_1",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroMalikTaunt() : void
      {
         if(this.§_-EF§ < this.§_-GU§)
         {
            return;
         }
         switch(this.§_-Gz§)
         {
            case 1:
               SoundManager.getInstance().playSound("hero_malik_1",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("hero_malik_2",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("hero_malik_3",this.§_-Lh§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("hero_malik_4",this.§_-Lh§,0,0);
         }
         this.§_-Gz§++;
         this.§_-EF§ = 0;
         if(this.§_-Gz§ > 4)
         {
            this.§_-Gz§ = 1;
         }
      }
      
      public function playHeroMalikDeath() : void
      {
         SoundManager.getInstance().playSound("hero_malik_death",this.§_-Lh§,0,0);
      }
      
      public function playHeroMalikHit() : void
      {
         SoundManager.getInstance().playSound("hero_malik_hit",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroMalikCharge() : void
      {
         SoundManager.getInstance().playSound("hero_malik_charge",this.V_FX_COMMON_MEDIUM,0,0);
      }
      
      public function playHeroMalikJump() : void
      {
         SoundManager.getInstance().playSound("hero_malik_jump",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function §_-IV§() : void
      {
         SoundManager.getInstance().playSound("hero_malik_1",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroAlleriaTaunt() : void
      {
         if(this.§_-EF§ < this.§_-GU§)
         {
            return;
         }
         switch(this.§_-Gz§)
         {
            case 1:
               SoundManager.getInstance().playSound("hero_alleria_1",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("hero_alleria_2",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("hero_alleria_3",this.§_-Lh§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("hero_alleria_4",this.§_-Lh§,0,0);
         }
         this.§_-Gz§++;
         this.§_-EF§ = 0;
         if(this.§_-Gz§ > 4)
         {
            this.§_-Gz§ = 1;
         }
      }
      
      public function playHeroAlleriaDeath() : void
      {
         SoundManager.getInstance().playSound("hero_alleria_death",this.§_-Lh§,0,0);
      }
      
      public function playHeroAlleriaSummon() : void
      {
         SoundManager.getInstance().playSound("hero_alleria_summon",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroAlleriaMultishoot() : void
      {
         SoundManager.getInstance().playSound("hero_alleria_multishoot",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroAlleriaWildcat() : void
      {
         SoundManager.getInstance().playSound("hero_alleria_wildcat",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function §_-59§() : void
      {
         SoundManager.getInstance().playSound("hero_alleria_2",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroBolinTaunt() : void
      {
         if(this.§_-EF§ < this.§_-GU§)
         {
            return;
         }
         switch(this.§_-Gz§)
         {
            case 1:
               SoundManager.getInstance().playSound("hero_bolin_1",this.§_-Lh§,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("hero_bolin_2",this.§_-Lh§,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("hero_bolin_3",this.§_-Lh§,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("hero_bolin_4",this.§_-Lh§,0,0);
         }
         this.§_-Gz§++;
         this.§_-EF§ = 0;
         if(this.§_-Gz§ > 4)
         {
            this.§_-Gz§ = 1;
         }
      }
      
      public function playHeroBolinDeath() : void
      {
         SoundManager.getInstance().playSound("hero_bolin_death",this.§_-Lh§,0,0);
      }
      
      public function §_-9s§() : void
      {
         SoundManager.getInstance().playSound("hero_bolin_brea_shoot",this.V_FX_COMMON_MEDIUM,0,0);
      }
      
      public function §_-L8§() : void
      {
         SoundManager.getInstance().playSound("hero_bolin_brea_hit",this.V_FX_COMMON_MEDIUM,0,0);
      }
      
      public function §_-6u§() : void
      {
         SoundManager.getInstance().playSound("hero_bolin_mine",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function §_-2R§() : void
      {
         SoundManager.getInstance().playSound("hero_bolin_1",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroMageTaunt() : void
      {
         if(this.§_-EF§ < this.§_-GU§)
         {
            return;
         }
         switch(this.§_-Gz§)
         {
            case 1:
               SoundManager.getInstance().playSound("hero_mage_1",this.V_FX_COMMON_MEDIUM_LOW,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("hero_mage_2",this.V_FX_COMMON_MEDIUM_LOW,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("hero_mage_3",this.V_FX_COMMON_MEDIUM_LOW,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("hero_mage_4",this.V_FX_COMMON_MEDIUM_LOW,0,0);
         }
         this.§_-Gz§++;
         this.§_-EF§ = 0;
         if(this.§_-Gz§ > 4)
         {
            this.§_-Gz§ = 1;
         }
      }
      
      public function playHeroMageDeath() : void
      {
         SoundManager.getInstance().playSound("hero_mage_death",this.§_-Lh§,0,0);
      }
      
      public function playHeroMageRainCharge() : void
      {
         SoundManager.getInstance().playSound("hero_mage_rain_charge",this.V_FX_COMMON_MEDIUM,0,0);
      }
      
      public function §_-RE§() : void
      {
         this.§_-5y§++;
         SoundManager.getInstance().playSound("hero_mage_rain_drop_" + this.§_-5y§,this.V_FX_COMMON_MEDIUM,0,0);
         if(this.§_-5y§ >= 8)
         {
            this.§_-5y§ = 1;
         }
      }
      
      public function playHeroMageShadow() : void
      {
         SoundManager.getInstance().playSound("hero_mage_shadow",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function §_-Ta§() : void
      {
         SoundManager.getInstance().playSound("hero_mage_2",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroIgnusTaunt() : void
      {
         if(this.§_-EF§ < this.§_-GU§)
         {
            return;
         }
         switch(this.§_-Gz§)
         {
            case 1:
               SoundManager.getInstance().playSound("hero_ignus_1",this.V_FX_COMMON_MEDIUM_LOW,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("hero_ignus_2",this.V_FX_COMMON_MEDIUM_LOW,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("hero_ignus_3",this.V_FX_COMMON_MEDIUM_LOW,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("hero_ignus_4",this.V_FX_COMMON_MEDIUM_LOW,0,0);
         }
         this.§_-Gz§++;
         this.§_-EF§ = 0;
         if(this.§_-Gz§ > 4)
         {
            this.§_-Gz§ = 1;
         }
      }
      
      public function playHeroIgnusDeath() : void
      {
         SoundManager.getInstance().playSound("hero_ignus_death",this.§_-Lh§,0,0);
      }
      
      public function playHeroIgnusArea() : void
      {
         SoundManager.getInstance().playSound("hero_ignus_area",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroIgnusStart() : void
      {
         SoundManager.getInstance().playSound("hero_ignus_fire_start",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroIgnusEnd() : void
      {
         SoundManager.getInstance().playSound("hero_ignus_fire_end",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function §_-GH§() : void
      {
         SoundManager.getInstance().playSound("hero_ignus_1",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroDenasTaunt() : void
      {
         if(this.§_-EF§ < this.§_-GU§)
         {
            return;
         }
         switch(this.§_-Gz§)
         {
            case 1:
               SoundManager.getInstance().playSound("hero_denas_1",this.V_FX_COMMON_MEDIUM_LOW,0,0);
               break;
            case 2:
               SoundManager.getInstance().playSound("hero_denas_2",this.V_FX_COMMON_MEDIUM_LOW,0,0);
               break;
            case 3:
               SoundManager.getInstance().playSound("hero_denas_3",this.V_FX_COMMON_MEDIUM_LOW,0,0);
               break;
            case 4:
               SoundManager.getInstance().playSound("hero_denas_4",this.V_FX_COMMON_MEDIUM_LOW,0,0);
         }
         this.§_-Gz§++;
         this.§_-EF§ = 0;
         if(this.§_-Gz§ > 4)
         {
            this.§_-Gz§ = 1;
         }
      }
      
      public function playHeroDenasDeath() : void
      {
         SoundManager.getInstance().playSound("hero_denas_death",this.§_-Lh§,0,0);
      }
      
      public function playHeroDenasAttack() : void
      {
         SoundManager.getInstance().playSound("hero_denas_attack",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function playHeroDenasBuff() : void
      {
         this.§_-9C§++;
         SoundManager.getInstance().playSound("hero_denas_buff_" + this.§_-9C§,this.V_FX_COMMON_MEDIUM,0,0);
         if(this.§_-9C§ >= 2)
         {
            this.§_-9C§ = 0;
         }
      }
      
      public function §_-Rg§() : void
      {
         SoundManager.getInstance().playSound("hero_denas_4",this.V_FX_COMMON_MEDIUM_LOW,0,0);
      }
      
      public function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      public function destroyThis() : void
      {
         this.level = null;
      }
   }
}

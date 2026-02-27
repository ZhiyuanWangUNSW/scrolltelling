# app.R

library(shiny)

ui <- fluidPage(
  
  tags$head(
    
    tags$style(HTML("

      body { background:#fff; margin:0; font-family: system-ui, -apple-system, Segoe UI, Roboto, sans-serif; }
 
      /* PDF-like page container */

      .pdf-page{

        width:46vw; max-width:900px; min-width:320px;

        margin:40px auto;

        background:#fff;

        border:1px solid #e6e6e6;

        box-shadow:0 8px 24px rgba(0,0,0,0.08);

        border-radius:12px;

        overflow:hidden;            /* important so the cover image clips nicely */

      }
 
      /* Cover area */

      .cover{

        position:relative;

        height:78vh;               /* feel free to change: 70vh/80vh */

        min-height:640px;

        background:#f7f7f7;

      }

      .cover-bg{

        position:absolute; inset:0;

        width:100%; height:100%;

        object-fit:cover;

        display:block;

      }
 
      /* Content over the cover */

      .cover-content{

        position:relative;

        height:100%;

        padding:44px 48px;

      }
 
      /* Read button (top-right) */

      .tts-topright{

        position:absolute;

        top:18px; right:18px;

        display:flex; gap:10px;

        z-index:5;

      }

      .tts-btn{

        border:1px solid #ddd;

        background:rgba(255,255,255,0.92);

        padding:10px 12px;

        border-radius:12px;

        cursor:pointer;

        font-size:16px;

        backdrop-filter: blur(6px);

      }

      .tts-btn:hover{ background:rgba(255,255,255,1); }
 
      /* Logo bottom-left */

      .logo{

        position:absolute;

        left:10px; bottom:10px;

        width:100px;               /* adjust to your logo */

        height:auto;

        z-index:5;

      }

            .cover-text{
      
        position:absolute;
      
        top:200px;
       
        right:12%;
      
        width:420px;
       
        color:#F2F2F2;
      
      }
 
      .cover-text .title{
      
        font-size:42px;
      
        font-weight:600;
      
        margin:0 0 30px 0;
      
        text-align:center;
      
      }
       
      .cover-text .sub{
      
        font-size:20px;
      
        font-weight:400;
      
        margin:0;
      
        text-align:right;
      
      }
 
/* ---- Page 2 (text page 1) ---- */

.page{

  position:relative;

  width:100%;

  aspect-ratio: 3 / 4;   /* try 2 / 3 if you want taller */

  overflow:hidden;

}
 
.page-bg{

  position:absolute; inset:0;

  width:100%; height:100%;

  object-fit:cover;      /* if cropping feels bad, switch to: contain */

}
 
.page-content{

  position:relative;

  height:100%;

  padding:54px 56px;

}
 
/* Typography similar to your screenshot */

.page2-title{

  font-size:34px;

  font-weight:600;

  margin:-20px 0 20px -20px;

  color:#000;

}
 
.page2-list{

  margin:140px 0 0 40px;   /* controls where the bullets sit */

  font-size:30px;

  line-height:1.35;

  color:#000;

  max-width:620px;

}

.page-tts{

  position:absolute;

  top:18px; right:18px;

  display:flex; gap:10px;

  z-index:5;

}

.page2-list li{ margin:14px 0; }
 
/* ---- Page 3 (text page 2) ---- */

.page{

  position:relative;

  width:100%;

  aspect-ratio: 3 / 4;   /* try 2 / 3 if you want taller */

  overflow:hidden;

}
 
.page-bg{

  position:absolute; inset:0;

  width:100%; height:100%;

  object-fit:cover;      /* if cropping feels bad, switch to: contain */

}
 
.page-content{

  position:relative;

  height:100%;

  padding:54px 56px;

}
 
/* Typography similar to your screenshot */

.page3-title{

  font-size:30px;

  font-weight:600;

  margin:-20px 0 20px -20px;

  color:#000;

}
 
.page3-list{

  margin:140px 0 0 40px;   /* controls where the bullets sit */

  font-size:22px;

  line-height:1.35;

  color:#000;

  max-width:620px;

}

.page-tts{

  position:absolute;

  top:18px; right:18px;

  display:flex; gap:10px;

  z-index:5;

}

.page3-list li{ margin:14px 0; }
 
/* ---- Page 4 (text page 3) ---- */

.page{

  position:relative;

  width:100%;

  aspect-ratio: 3 / 4;   /* try 2 / 3 if you want taller */

  overflow:hidden;

}
 
.page-bg{

  position:absolute; inset:0;

  width:100%; height:100%;

  object-fit:cover;      /* if cropping feels bad, switch to: contain */

}
 
.page-content{

  position:relative;

  height:100%;

  padding:54px 56px;

}
 
/* Typography similar to your screenshot */

.page4-title{

  font-size:30px;

  font-weight:600;

  margin:-20px 0 20px -20px;

  color:#000;

}
 
.page4-list{

  margin:140px 0 0 40px;   /* controls where the bullets sit */

  font-size:22px;

  line-height:1.35;

  color:#000;

  max-width:620px;

}

.page-tts{

  position:absolute;

  top:18px; right:18px;

  display:flex; gap:10px;

  z-index:5;

}

.page4-list li{ margin:14px 0; }


    ")),
    
    tags$script(HTML("

      function speakFromBtn(btn){

        const text = btn.getAttribute('data-tts') || '';

        if(!text) return;

        window.speechSynthesis.cancel();

        const u = new SpeechSynthesisUtterance(text);

        u.lang = 'en-AU';

        window.speechSynthesis.speak(u);

      }

      function stopSpeech(){

        window.speechSynthesis.cancel();

      }
      

    "))
    
  ),
  
  # ---- PDF-like page ----
  
  div(class = "pdf-page",
      
      div(class = "cover",
          
          # Background image (put cover-bg.png in www/)
          
          tags$img(
            
            src = "cover-bg.png",
            
            class = "cover-bg",
            
            alt = "Cover background"
            
          ),
          
          div(class="cover-content",
              
              # Top-right buttons
              
              div(class="tts-topright",
                  
                  tags$button(
                    
                    type="button", class="tts-btn",
                    
                    `data-tts`="Emergency Exit Plan. Health Translation Hub. Level 6. North.",
                    
                    onclick="speakFromBtn(this)",
                    
                    "🔊 Read"
                    
                  ),
                  
                  div(class="cover-text",
                      
                      tags$div(class="title", "Emergency Exit Plan"),
                      
                      tags$div(class="sub",
                               
                               HTML("Health Translation Hub<br>Level 6<br>North"))
                      
                  ),
                  
                  tags$button(
                    
                    type="button", class="tts-btn",
                    
                    onclick="stopSpeech()",
                    
                    "⏹ Stop"
                    
                  )
                  
              ),
              
              # Bottom-left logo (put logo.png in www/)
              
              tags$img(
                
                src = "logo.png",
                
                class = "logo",
                
                alt = "Logo"
                
              )
              
          )
          
      ),
      
      div(class="page",
          
          tags$img(src="text-bg.png", class="page-bg", alt="Text background"),
          
          div(class="page-content",
              
              div(class="page-tts",
                  
                  tags$button(
                    
                    type="button", class="tts-btn",
                    
                    `data-tts`="What is this. This map shows where the emergency stairwells are located. It helps you understand how to leave our office area safely.",
                    
                    onclick="speakFromBtn(this)",
                    
                    "🔊 Read"
                    
                  ),
                  
                  tags$button(
                    
                    type="button", class="tts-btn",
                    
                    onclick="stopSpeech()",
                    
                    "⏹ Stop"
                    
                  )
                  
              ),
              
              tags$h2(class="page2-title", "What is this"),
              
              tags$ul(class="page2-list",
                      
                      tags$li("This map shows where the emergency stairwells are located."),
                      
                      tags$li("It helps you understand how to leave our office area safely.")
                      
              )
              
          )
          
      ),
      
      div(class="page",
          
          tags$img(src="text-bg.png", class="page-bg", alt="Text background"),
          
          div(class="page-content",
              
              div(class="page-tts",
                  
                  tags$button(
                    
                    type="button", class="tts-btn",
                    
                    `data-tts`="Important to know. The red line shows a general path to the nearest stairwell. There are two emergency stairwells on our side. In a real emergency, follow the exit signs and instructions from fire wardens. The photos help you recognize the stairwell door.",
                    
                    onclick="speakFromBtn(this)",
                    
                    "🔊 Read"
                    
                  ),
                  
                  tags$button(
                    
                    type="button", class="tts-btn",
                    
                    onclick="stopSpeech()",
                    
                    "⏹ Stop"
                    
                  )
                  
              ),
              
              tags$h2(class="page3-title", HTML("Important to<br>know") ),
              
              tags$ul(class="page3-list",
                      
                      tags$li("The red line shows a general path to the nearest stairwell."),
                      
                      tags$li("There are two emergency stairwells on our side."),
                      
                      tags$li("In a real emergency, follow the EXIT signs and instructions from fire wardens."),
                      
                      tags$li("The photos help you recognize the stairwell door.")
                      
              )
              
          )
          
      ),
      
      div(class="page",
          
          tags$img(src="text-bg.png", class="page-bg", alt="Text background"),
          
          div(class="page-content",
              
              div(class="page-tts",
                  
                  tags$button(
                    
                    type="button", class="tts-btn",
                    
                    `data-tts`="During the emergency. Stay calm. Walk. Do not run. Do not use the lift. Follow the exit signs and use the emergency stairwell.",
                    
                    onclick="speakFromBtn(this)",
                    
                    "🔊 Read"
                    
                  ),
                  
                  tags$button(
                    
                    type="button", class="tts-btn",
                    
                    onclick="stopSpeech()",
                    
                    "⏹ Stop"
                    
                  )
                  
              ),
              
              tags$h2(class="page4-title", HTML("During the<br>emergency")),
              
              tags$ul(class="page4-list",
                      
                      tags$li("Stay calm"),
                      
                      tags$li("Walk. Do not run"),
                      
                      tags$li(HTML("<strong>Do not use the lift</strong>")),
                      
                      tags$li("Follow the Exit signs and use the emergency stairwell")
                      
              )
              
          )
          
      ),
      div(class="page",
          tags$img(src="map-bg.png", class="page-bg", alt="Background"),
          
          div(class="page-tts",
              tags$button(
                type="button", class="tts-btn",
                `data-tts`="This is our area.",
                onclick="speakFromBtn(this)",
                "🔊 Read"
              ),
              tags$button(
                type="button", class="tts-btn",
                onclick="stopSpeech()",
                "⏹ Stop"
              )
          ),
          
          div(class="page-content",
              tags$h2(class="page2-title", "Our Area"),
              tags$img(src="area.png", class="map-slide", alt="Our Area map",style = "display:block; width:380px; max-width:100%; height:auto; margin:80px auto 0;")
          )
      ),
      div(class="page",
          tags$img(src="map-bg.png", class="page-bg", alt="Background"),
          
          div(class="page-tts",
              tags$button(
                type="button", class="tts-btn",
                `data-tts`="Go through the kitchen.",
                onclick="speakFromBtn(this)",
                "🔊 Read"
              ),
              tags$button(
                type="button", class="tts-btn",
                onclick="stopSpeech()",
                "⏹ Stop"
              )
          ),
          
          div(class="page-content",
              tags$h2(class="page2-title", "Through kitchen"),
              tags$img(src="path.png", class="map-slide", alt="Through kitchen path",style = "display:block; width:380px; max-width:100%; height:auto; margin:80px auto 0;")
          )
      ),
      div(class="page",
          tags$img(src="map-bg.png", class="page-bg", alt="Background"),
          
          div(class="page-tts",
              tags$button(
                type="button", class="tts-btn",
                `data-tts`="Emergency Stairwell is here.",
                onclick="speakFromBtn(this)",
                "🔊 Read"
              ),
              tags$button(
                type="button", class="tts-btn",
                onclick="stopSpeech()",
                "⏹ Stop"
              )
          ),
          
          div(class="page-content",
              tags$h2(class="page2-title", "Exit"),
              tags$img(src="exit.png", class="map-slide", alt="Exit",style = "display:block; width:380px; max-width:100%; height:auto; margin:80px auto 0;")
          )
      )
      
  )
  
)

server <- function(input, output, session) {}

shinyApp(ui, server)

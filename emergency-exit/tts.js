(function () {
  function pickVoice() {
    const voices = window.speechSynthesis.getVoices() || [];
    return (
      voices.find(v => (v.lang || "").toLowerCase().startsWith("en-au")) ||
      voices.find(v => (v.lang || "").toLowerCase().startsWith("en")) ||
      null
    );
  }

  function speak(text) {
    if (!("speechSynthesis" in window)) {
      console.warn("speechSynthesis not supported in this browser");
      return;
    }

    // stop any ongoing speech
    window.speechSynthesis.cancel();

    const u = new SpeechSynthesisUtterance(text);

    const v = pickVoice();
    if (v) u.voice = v;

    u.rate = 1.0;
    u.pitch = 1.0;
    u.volume = 1.0;

    window.speechSynthesis.speak(u);
  }

  // Ensure voices are loaded (some browsers load async)
  window.speechSynthesis.onvoiceschanged = function () {
    window.speechSynthesis.getVoices();
  };

  document.addEventListener("click", function (e) {
    const btn = e.target.closest("[data-tts]");
    if (!btn) return;

    const text = btn.getAttribute("data-tts") || "";
    speak(text);
  });
})();
// CBSE 10th standard Learning Portal Prototype Application Logic

// 1. DATA CATALOGS
const COURSE_CATALOG = {
    maths: {
        name: "Mathematics",
        chapters: [
            {
                title: "Chapter 1: Real Numbers",
                lessons: [
                    { id: "m-1-1", title: "1.1 Euclid's Division Lemma & Theorem", type: "video", isFree: true, duration: "12:45", videoType: "math-graph" },
                    { id: "m-1-2", title: "1.2 Fundamental Theorem of Arithmetic", type: "video", isFree: true, duration: "18:20", videoType: "math-graph" },
                    { id: "m-1-3", title: "Revision Notes: Real Numbers", type: "note", isFree: true }
                ]
            },
            {
                title: "Chapter 2: Polynomials & Equations",
                lessons: [
                    { id: "m-2-1", title: "2.1 Geometrical Meaning of Zeroes", type: "video", isFree: false, duration: "22:15", videoType: "math-graph" },
                    { id: "m-2-2", title: "2.2 Relationship between Zeroes & Coefficients", type: "video", isFree: false, duration: "15:40", videoType: "math-graph" },
                    { id: "m-2-3", title: "2.3 Solving Quadratic Equations", type: "video", isFree: false, duration: "25:10", videoType: "math-graph" }
                ]
            }
        ]
    },
    science: {
        name: "Science",
        chapters: [
            {
                title: "Chapter 1: Chemical Reactions",
                lessons: [
                    { id: "s-1-1", title: "1.1 Writing Chemical Equations", type: "video", isFree: true, duration: "14:10", videoType: "science-atom" },
                    { id: "s-1-2", title: "1.2 Types of Chemical Reactions", type: "video", isFree: false, duration: "24:30", videoType: "science-atom" },
                    { id: "s-1-3", title: "Notes: Balancing Chemical Equations", type: "note", isFree: true }
                ]
            },
            {
                title: "Chapter 12: Electricity",
                lessons: [
                    { id: "s-12-1", title: "12.1 Electric Current & Potential Difference", type: "video", isFree: true, duration: "16:50", videoType: "science-circuit" },
                    { id: "s-12-2", title: "12.2 Ohm's Law & Circuit Elements", type: "video", isFree: false, duration: "28:15", videoType: "science-circuit" },
                    { id: "s-12-3", title: "12.3 Resistance in Series and Parallel", type: "video", isFree: false, duration: "32:40", videoType: "science-circuit" }
                ]
            }
        ]
    },
    social: {
        name: "Social Science",
        chapters: [
            {
                title: "Chapter 1: Nationalism in India",
                lessons: [
                    { id: "ss-1-1", title: "1.1 First World War & Khilafat Movement", type: "video", isFree: true, duration: "18:40", videoType: "social-map" },
                    { id: "ss-1-2", title: "1.2 Differing Strands within the Movement", type: "video", isFree: false, duration: "22:50", videoType: "social-map" },
                    { id: "ss-1-3", title: "Notes: Timeline of Satyagraha Movements", type: "note", isFree: true }
                ]
            }
        ]
    }
};

const NOTES_CONTENT = {
    "m-1-3": `
        <h4>CBSE Class 10 Maths - Chapter 1: Real Numbers</h4>
        <p><strong>1. Fundamental Theorem of Arithmetic:</strong> Every composite number can be expressed (factorized) as a product of prime numbers, and this factorization is unique, apart from the order in which the prime factors occur.</p>
        <p><em>Formula:</em> For any two positive integers a and b: <br><code>HCF(a, b) × LCM(a, b) = a × b</code></p>
        
        <div class="ncert-doyouknow-box">
            <div class="ncert-doyouknow-header">Do You Know?</div>
            <p>The word <strong>Algorithm</strong> comes from the name of the 9th century Persian mathematician <em>al-Khwarizmi</em>. In fact, even the word 'algebra' is derived from his famous book <em>Kitab al-jabr wa’l-muqabala</em>.</p>
        </div>

        <p><strong>2. Rational & Irrational Numbers:</strong></p>
        <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>Rational numbers have terminating or non-terminating repeating decimal expansions.</div></div>
        <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>Irrational numbers (like √2, √3, π) have non-terminating non-repeating decimal expansions.</div></div>
        
        <p><strong>3. Proof of Irrationality:</strong> Typically proved using the method of contradiction (assuming root is rational, representing as p/q where p and q are co-prime, and showing they share a factor).</p>
    `,
    "s-1-3": `
        <div class="textbook-quote-container">
            <span class="textbook-quote-text">“Facts are not science — as the dictionary is not literature.”</span>
            <span class="textbook-quote-author">Martin H. Fischer</span>
        </div>

        <div class="textbook-chapter-header">
            <div class="textbook-chapter-header-left">
                <svg class="textbook-flask-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M6 3h12" />
                    <path d="M 9 3 v 6 L 4.2 19.5 A 1 1 0 0 0 5 21 h 14 a 1 1 0 0 0 .8 -1.5 L 15 9 V 3" />
                    <path d="M6 16h12" stroke-dasharray="2 2" stroke-width="1.5" opacity="0.5" />
                </svg>
                <div class="textbook-chapter-num-block">
                    <span class="textbook-chapter-label">CHAPTER</span>
                    <span class="textbook-chapter-number">1</span>
                </div>
                <div class="textbook-chapter-title-block">
                    Chemical Reactions<br>and Equations
                </div>
            </div>
            <div class="textbook-qr-code-block">
                <svg class="textbook-qr-img" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round">
                    <rect x="2" y="2" width="20" height="20" rx="1" fill="#f8fafc" stroke="#cbd5e1" stroke-width="0.5"/>
                    <rect x="4" y="4" width="6" height="6" fill="#0f172a" />
                    <rect x="5" y="5" width="4" height="4" fill="#ffffff" />
                    <rect x="6" y="6" width="2" height="2" fill="#0f172a" />
                    <rect x="14" y="4" width="6" height="6" fill="#0f172a" />
                    <rect x="15" y="5" width="4" height="4" fill="#ffffff" />
                    <rect x="16" y="6" width="2" height="2" fill="#0f172a" />
                    <rect x="4" y="14" width="6" height="6" fill="#0f172a" />
                    <rect x="5" y="15" width="4" height="4" fill="#ffffff" />
                    <rect x="6" y="16" width="2" height="2" fill="#0f172a" />
                    <rect x="14" y="14" width="2" height="2" fill="#0f172a" />
                    <rect x="18" y="14" width="2" height="2" fill="#0f172a" />
                    <rect x="16" y="16" width="2" height="2" fill="#0f172a" />
                    <rect x="14" y="18" width="4" height="2" fill="#0f172a" />
                    <rect x="18" y="18" width="2" height="2" fill="#0f172a" />
                    <rect x="11" y="5" width="1" height="3" fill="#0f172a" />
                    <rect x="11" y="10" width="3" height="1" fill="#0f172a" />
                    <rect x="5" y="11" width="3" height="1" fill="#0f172a" />
                    <rect x="10" y="14" width="1" height="4" fill="#0f172a" />
                </svg>
                <span class="textbook-qr-label">1064CH01</span>
            </div>
        </div>

        <p class="textbook-dropcap">Consider the following situations of daily life and think what happens when –</p>
        
        <div style="margin-left: 20px; margin-bottom: 20px;">
            <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>milk is left at room temperature during summers.</div></div>
            <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>an iron tawa/pan/nail is left exposed to humid atmosphere.</div></div>
            <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>grapes get fermented.</div></div>
            <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>food is cooked.</div></div>
            <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>food gets digested in our body.</div></div>
            <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>we respire.</div></div>
        </div>

        <p class="textbook-dropcap" style="margin-top: 15px;">In all the above situations, the nature and the identity of the initial substance have somewhat changed. We have already learnt about physical and chemical changes of matter in our previous classes. Whenever a chemical change occurs, we can say that a chemical reaction has taken place.</p>
        
        <p class="textbook-dropcap">You may perhaps be wondering as to what is actually meant by a chemical reaction. How do we come to know that a chemical reaction has taken place? Let us perform some activities to find the answer to these questions.</p>

        <div class="textbook-columns">
            <div class="textbook-col-left">
                <div class="ncert-activity-box" style="margin: 0;">
                    <div class="ncert-activity-header">Activity 1.1</div>
                    <p style="margin-bottom: 12px;"><span class="ncert-caution-tag">CAUTION:</span> This Activity needs the teacher’s assistance. It would be better if students wear suitable eyeglasses.</p>
                    <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>Clean a magnesium ribbon about 3-4 cm long by rubbing it with sandpaper.</div></div>
                    <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>Hold it with a pair of tongs. Burn it using a spirit lamp or burner and collect the ash so formed in a watch-glass as shown in Fig. 1.1. Burn the magnesium ribbon keeping it away as far as possible from your eyes.</div></div>
                    <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>What do you observe?</div></div>
                </div>
            </div>
            <div class="textbook-col-right">
                <div class="textbook-figure-box">
                    <svg class="textbook-figure-svg" width="280" height="200" viewBox="0 0 280 200" xmlns="http://www.w3.org/2000/svg">
                        <defs>
                            <linearGradient id="flameGrad" x1="0%" y1="100%" x2="0%" y2="0%">
                                <stop offset="0%" stop-color="#0284c7" stop-opacity="0.8"/>
                                <stop offset="40%" stop-color="#f97316"/>
                                <stop offset="100%" stop-color="#eab308"/>
                            </linearGradient>
                            <radialGradient id="glowGrad" cx="50%" cy="50%" r="50%">
                                <stop offset="0%" stop-color="#ffffff"/>
                                <stop offset="30%" stop-color="#fef08a" stop-opacity="0.9"/>
                                <stop offset="100%" stop-color="#fef08a" stop-opacity="0"/>
                            </radialGradient>
                        </defs>
                        <!-- Table surface -->
                        <line x1="10" y1="190" x2="270" y2="190" stroke="#cbd5e1" stroke-width="1.5"/>
                        
                        <!-- Burner -->
                        <rect x="30" y="150" width="14" height="40" fill="#64748b" rx="2"/>
                        <rect x="24" y="185" width="26" height="5" fill="#475569" rx="1"/>
                        <line x1="37" y1="150" x2="37" y2="142" stroke="#475569" stroke-width="2.5"/>
                        <polygon points="32,142 42,142 37,136" fill="#334155"/>
                        <path d="M37,136 Q30,122 37,108 Q44,122 37,136 Z" fill="url(#flameGrad)"/>
                        
                        <!-- Watch-glass -->
                        <path d="M85,175 Q125,195 165,175 Q125,183 85,175 Z" fill="#e2e8f0" stroke="#94a3b8" stroke-width="1" opacity="0.8"/>
                        <ellipse cx="125" cy="178" rx="28" ry="5" fill="#cbd5e1" opacity="0.4"/>
                        
                        <!-- Magnesium Oxide pile -->
                        <path d="M115,178 Q125,170 135,178 Z" fill="#f8fafc" stroke="#cbd5e1" stroke-width="0.5"/>
                        <circle cx="120" cy="178" r="1.5" fill="#f1f5f9"/>
                        <circle cx="127" cy="177" r="2" fill="#f8fafc"/>
                        <circle cx="131" cy="178" r="1.5" fill="#e2e8f0"/>
                        
                        <!-- Tongs -->
                        <!-- Hand simulation -->
                        <path d="M220,130 C224,122 232,122 236,130 L255,133 L255,142 L232,142 Z" fill="#ffedd5" stroke="#f97316" stroke-width="0.5"/>
                        <!-- Tong handles -->
                        <path d="M230,133 L160,135 L105,145" fill="none" stroke="#475569" stroke-width="1.5" stroke-linecap="round"/>
                        <path d="M232,137 L162,137 L105,149" fill="none" stroke="#475569" stroke-width="1.5" stroke-linecap="round"/>
                        <circle cx="161" cy="136" r="2.5" fill="#334155"/>
                        <path d="M105,145 L93,147 Q89,147 88,148" fill="none" stroke="#334155" stroke-width="1.5"/>
                        <path d="M105,149 L93,149 Q89,149 88,148" fill="none" stroke="#334155" stroke-width="1.5"/>
                        
                        <!-- Magnesium ribbon -->
                        <line x1="88" y1="148" x2="43" y2="137" stroke="#94a3b8" stroke-width="3.5" stroke-linecap="round"/>
                        
                        <!-- Glowing combustion -->
                        <circle cx="43" cy="137" r="14" fill="url(#glowGrad)"/>
                        <path d="M43,137 L39,131 L43,123 L47,131 Z" fill="#ffffff"/>
                        <path d="M43,137 L49,133 L58,137 L49,141 Z" fill="#ffffff"/>
                        <path d="M43,137 L47,143 L43,151 L39,143 Z" fill="#ffffff"/>
                        <path d="M43,137 L37,141 L28,137 L37,133 Z" fill="#ffffff"/>
                        
                        <!-- Pointers & Labels -->
                        <line x1="20" y1="170" x2="33" y2="170" stroke="#000000" stroke-width="0.5" stroke-dasharray="1.5,1.5"/>
                        <text x="2" y="172" font-family="var(--font-serif)" font-size="9" fill="#475569">Burner</text>
                        
                        <line x1="180" y1="110" x2="180" y2="133" stroke="#000000" stroke-width="0.5" stroke-dasharray="1.5,1.5"/>
                        <text x="174" y="105" font-family="var(--font-serif)" font-size="9" fill="#475569">Tong</text>
                        
                        <line x1="120" y1="115" x2="70" y2="141" stroke="#000000" stroke-width="0.5" stroke-dasharray="1.5,1.5"/>
                        <text x="110" y="110" font-family="var(--font-serif)" font-size="9" fill="#475569">Magnesium ribbon</text>
                        
                        <line x1="195" y1="165" x2="150" y2="178" stroke="#000000" stroke-width="0.5" stroke-dasharray="1.5,1.5"/>
                        <text x="200" y="168" font-family="var(--font-serif)" font-size="9" fill="#475569">Watch-glass</text>
                        
                        <line x1="180" y1="192" x2="132" y2="180" stroke="#000000" stroke-width="0.5" stroke-dasharray="1.5,1.5"/>
                        <text x="185" y="195" font-family="var(--font-serif)" font-size="9" fill="#475569">Magnesium oxide</text>
                    </svg>
                    <span class="textbook-figure-caption"><strong>Figure 1.1</strong> <em>Burning of a magnesium ribbon in air and collection of magnesium oxide in a watch-glass</em></span>
                </div>
            </div>
        </div>

        <p><strong>2. Law of Conservation of Mass:</strong> Matter can neither be created nor destroyed in a chemical reaction. Therefore, the total mass of reactants must equal the total mass of products. This is why equations must be balanced.</p>
        
        <div class="ncert-doyouknow-box">
            <div class="ncert-doyouknow-header">Do You Know?</div>
            <p>A solution of slaked lime produced by the reaction of Calcium Oxide with water is used for whitewashing walls. Calcium hydroxide reacts slowly with the carbon dioxide in air to form a thin layer of calcium carbonate (CaCO₃) on the walls, giving them a shiny finish.</p>
        </div>
    `,
    "ss-1-3": `
        <h4>CBSE Class 10 Social Science - Nationalism in India Notes</h4>
        <p><strong>1. Introduction of Satyagraha:</strong> Mahatma Gandhi returned to India in January 1915 from South Africa, where he successfully fought racist regimes using Satyagraha (insistence on truth).</p>
        
        <div class="ncert-activity-box">
            <div class="ncert-activity-header">Activity 1.4</div>
            <p>Read text summaries of Gandhi's speech at Champaran and identify the core arguments used to mobilize peasant farmers against oppressive indigo planters.</p>
            <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div>Outline the timeline of Satyagraha movements from 1916 to 1918.</div></div>
        </div>

        <p><strong>2. Early Satyagraha Movements in India:</strong></p>
        <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div><strong>1917 (Champaran, Bihar):</strong> Against oppressive indigo plantation system.</div></div>
        <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div><strong>1917 (Kheda, Gujarat):</strong> Demanding revenue relaxation for farmers hit by crop failure.</div></div>
        <div class="ncert-bullet-item"><div class="ncert-bullet-square"></div><div><strong>1918 (Ahmedabad, Gujarat):</strong> Cotton mill workers strike.</div></div>
        
        <p><strong>3. Rowlatt Act (1919):</strong> Allowed detention of political prisoners without trial for up to 2 years. Led to nationwide hartal and the tragic Jallianwala Bagh incident on April 13, 1919.</p>
    `
};

const QUIZZES = [
    {
        id: "quiz-math-1",
        subject: "maths",
        title: "Algebra & Real Numbers Practice Test",
        duration: "5 mins",
        questionsCount: 5,
        questions: [
            {
                q: "If HCF(306, 657) = 9, what is their LCM?",
                options: ["22,338", "18,220", "24,558", "12,680"],
                answer: 0
            },
            {
                q: "Euclid's Division Lemma states that for positive integers a and b, there exist unique integers q and r satisfying a = bq + r. What is the range of r?",
                options: ["0 < r < b", "0 ≤ r < b", "0 < r ≤ b", "0 ≤ r ≤ b"],
                answer: 1
            },
            {
                q: "Which of the following is an irrational number?",
                options: ["3.1415", "22/7", "3.141414...", "√5"],
                answer: 3
            },
            {
                q: "If α and β are zeroes of the quadratic polynomial ax² + bx + c, then α + β equals:",
                options: ["c/a", "-b/a", "b/a", "-c/a"],
                answer: 1
            },
            {
                q: "The decimal expansion of 13/3125 terminates after how many decimal places?",
                options: ["3 places", "4 places", "5 places", "6 places"],
                answer: 2
            }
        ]
    },
    {
        id: "quiz-science-1",
        subject: "science",
        title: "Electricity & Circuit Theory Test",
        duration: "5 mins",
        questionsCount: 4,
        questions: [
            {
                q: "What is the SI unit of electric potential difference?",
                options: ["Ampere", "Ohm", "Volt", "Joule"],
                answer: 2
            },
            {
                q: "How does the resistance of a wire change if its length is doubled and cross-sectional area is halved?",
                options: ["Remains the same", "Doubles", "Halves", "Quadruples (4x)"],
                answer: 3
            },
            {
                q: "Three resistors of 2Ω, 3Ω, and 6Ω are connected in parallel. What is their equivalent resistance?",
                options: ["1 Ω", "11 Ω", "5 Ω", "0.5 Ω"],
                answer: 0
            },
            {
                q: "Ohm's law states that the current flowing through a conductor is directly proportional to the potential difference, provided which factor remains constant?",
                options: ["Length", "Area of cross-section", "Temperature", "Resistance"],
                answer: 2
            }
        ]
    }
];

// 2. STATE MANAGEMENT
let appState = {
    user: {
        name: "Sagar Sharma",
        isPremium: false,
        streak: 5,
        lastActiveDate: new Date().toDateString(),
        unlockedLessons: ["m-1-1", "m-1-2", "m-1-3", "s-1-1", "s-12-1", "ss-1-1", "ss-1-3"], // Free lessons
        downloadedLessons: [] // Offline storage list
    },
    activeView: "dashboard",
    activeSubject: "maths",
    selectedLesson: null,
    activeQuiz: null,
    quizIndex: 0,
    quizAnswers: [],
    videoPlaying: false,
    videoDuration: 180, // Simulation seconds
    videoCurrentTime: 0,
    videoInterval: null,
    canvasAnimFrame: null,
    isOffline: false
};

// 3. UI ELEMENT REFERENCES
const elements = {
    themeToggle: document.getElementById("theme-toggle"),
    navItems: document.querySelectorAll(".nav-item"),
    views: document.querySelectorAll(".content-view"),
    headerTitle: document.getElementById("header-title"),
    headerSubtitle: document.getElementById("header-subtitle"),
    headerUpgradeBtn: document.getElementById("header-upgrade-btn"),
    streakWidget: document.getElementById("streak-widget"),
    
    // Video view elements
    lessonsList: document.getElementById("lessons-list"),
    videoPlayerWrapper: document.getElementById("video-player-wrapper"),
    videoCanvas: document.getElementById("video-canvas-anim"),
    videoPlayBtn: document.getElementById("video-play-btn"),
    videoPlayOverlay: document.getElementById("video-play-overlay"),
    videoLockOverlay: document.getElementById("video-lock-overlay"),
    videoTimeDisplay: document.getElementById("video-time-display"),
    videoProgressSlider: document.getElementById("video-progress-slider"),
    qualityBtn: document.getElementById("quality-btn"),
    qualityLbl: document.getElementById("quality-lbl"),
    qualityDropdown: document.getElementById("quality-dropdown"),
    videoDownloadBtn: document.getElementById("video-download-btn"),
    lessonTitle: document.getElementById("lesson-title"),
    lessonDesc: document.getElementById("lesson-desc"),
    lessonFreeBadge: document.getElementById("lesson-free-badge"),
    notesContentArea: document.getElementById("notes-content-area"),
    notesDownloadBtn: document.getElementById("notes-download-btn"),
    downloadBubble: document.getElementById("download-progress-bubble"),
    downloadBubbleTitle: document.getElementById("download-bubble-title"),
    downloadBubblePct: document.getElementById("download-bubble-pct"),
    subTabs: document.querySelectorAll(".sub-tab"),
    lockUpgradeBtn: document.getElementById("lock-overlay-upgrade-btn"),
    
    // Quiz view elements
    quizIntro: document.getElementById("quiz-intro-section"),
    quizRunning: document.getElementById("quiz-running-section"),
    quizResult: document.getElementById("quiz-result-section"),
    quizList: document.getElementById("quiz-list-container"),
    quizQuestionText: document.getElementById("quiz-question-text"),
    quizOptions: document.getElementById("quiz-options-container"),
    quizProgressText: document.getElementById("quiz-progress-text"),
    quizProgressBarFill: document.getElementById("quiz-progress-bar-fill"),
    quizNextBtn: document.getElementById("quiz-next-btn"),
    quizExitBtn: document.getElementById("quiz-exit-btn"),
    quizRetryBtn: document.getElementById("quiz-retry-btn"),
    quizDashboardBtn: document.getElementById("quiz-dashboard-btn"),
    quizStreakAlert: document.getElementById("quiz-streak-alert"),
    resScore: document.getElementById("res-score"),
    resPercentage: document.getElementById("res-percentage"),
    resStatus: document.getElementById("res-status"),
    resultIconRing: document.getElementById("result-icon-ring"),
    
    // Billing/Checkout modal
    paymentModal: document.getElementById("payment-modal"),
    closeModalBtn: document.getElementById("modal-close-btn"),
    startCheckoutBtn: document.getElementById("start-checkout-btn"),
    payConfirmBtn: document.getElementById("pay-confirm-btn"),
    paymentTabs: document.querySelectorAll(".pay-tab"),
    paymentPanels: document.querySelectorAll(".payment-panel"),
    paymentSpinner: document.getElementById("payment-spinner"),
    paymentErrorBox: document.getElementById("payment-error-box"),
    paymentErrorMsg: document.getElementById("payment-error-message"),
    billingStatusTag: document.getElementById("billing-status-tag"),
    billingStatusDesc: document.getElementById("billing-status-desc"),
    pricingOfferCard: document.getElementById("pricing-offer-card"),
    userStatusBadge: document.querySelector(".user-status-badge"),
    
    // Offline indicator
    networkOfflineBadge: document.getElementById("network-offline-badge")
};

// 4. THEME CONTROLLER (Dark / Light)
function initTheme() {
    const savedTheme = localStorage.getItem("cbse_theme") || "light";
    document.documentElement.setAttribute("data-theme", savedTheme);
    updateThemeIcon(savedTheme);

    elements.themeToggle.addEventListener("click", () => {
        const currentTheme = document.documentElement.getAttribute("data-theme");
        const nextTheme = currentTheme === "dark" ? "light" : "dark";
        document.documentElement.setAttribute("data-theme", nextTheme);
        localStorage.setItem("cbse_theme", nextTheme);
        updateThemeIcon(nextTheme);
    });
}

function updateThemeIcon(theme) {
    const icon = elements.themeToggle.querySelector("i");
    if (theme === "dark") {
        icon.className = "fa-solid fa-sun";
    } else {
        icon.className = "fa-solid fa-moon";
    }
}

// 5. APP NAVIGATION ROUTING
function initNavigation() {
    elements.navItems.forEach(item => {
        item.addEventListener("click", (e) => {
            e.preventDefault();
            const target = item.getAttribute("data-target");
            switchView(target);
        });
    });

    // Subject cards routing from dashboard
    document.querySelectorAll(".subject-card").forEach(card => {
        card.addEventListener("click", () => {
            const sub = card.getAttribute("data-subject");
            appState.activeSubject = sub;
            
            // Sync subject tabs in lessons view
            elements.subTabs.forEach(tab => {
                if (tab.getAttribute("data-subject") === sub) {
                    tab.classList.add("active");
                } else {
                    tab.classList.remove("active");
                }
            });
            
            switchView("lessons");
            loadLessonsList();
        });
    });

    // Quick Upgrade CTA buttons
    elements.headerUpgradeBtn.addEventListener("click", () => switchView("billing"));
    if (elements.lockUpgradeBtn) {
        elements.lockUpgradeBtn.addEventListener("click", () => switchView("billing"));
    }
}

function switchView(viewId) {
    appState.activeView = viewId;
    
    // Stop video playing if changing view
    if (viewId !== "lessons") {
        pauseVideo();
    }

    elements.navItems.forEach(item => {
        if (item.getAttribute("data-target") === viewId) {
            item.classList.add("active");
        } else {
            item.classList.remove("active");
        }
    });

    elements.views.forEach(view => {
        if (view.id === `view-${viewId}`) {
            view.classList.add("active");
        } else {
            view.classList.remove("active");
        }
    });

    // Update Header text
    let title = "CBSE Board Portal";
    let subtitle = "Online Learning Portal for 10th standard CBSE Board.";
    
    switch (viewId) {
        case "dashboard":
            title = `Welcome back, ${appState.user.name}!`;
            subtitle = "Stay consistent. Academic success is a daily habit.";
            break;
        case "lessons":
            title = "Animated Video Lessons & Revision Notes";
            subtitle = "Interactive whiteboard visuals and text transcripts.";
            loadLessonsList();
            break;
        case "quiz":
            title = "Practice Quizzes";
            subtitle = "Test your concepts and secure your study streak.";
            loadQuizList();
            break;
        case "progress":
            title = "Student Mastery Metrics";
            subtitle = "Detailed analysis of your curriculum readiness.";
            break;
        case "billing":
            title = "Premium Subscription Management";
            subtitle = "Unlock all CBSE animations and offline downloads.";
            break;
    }
    
    elements.headerTitle.innerText = title;
    elements.headerSubtitle.innerText = subtitle;
    elements.contentBody.scrollTop = 0;
}

// 6. VIDEO LESSONS CONTROLLER & RENDERER
function initLessonsView() {
    elements.subTabs.forEach(tab => {
        tab.addEventListener("click", () => {
            elements.subTabs.forEach(t => t.classList.remove("active"));
            tab.classList.add("active");
            appState.activeSubject = tab.getAttribute("data-subject");
            loadLessonsList();
        });
    });

    // Setup Video Slider Input
    elements.videoProgressSlider.addEventListener("input", (e) => {
        const pct = e.target.value;
        appState.videoCurrentTime = Math.floor((pct / 100) * appState.videoDuration);
        updateVideoTimerUI();
    });

    // Video Play Buttons
    elements.videoPlayBtn.addEventListener("click", toggleVideoPlayback);
    elements.videoPlayOverlay.addEventListener("click", toggleVideoPlayback);

    // Setup Video Quality Selectors
    elements.qualityDropdown.querySelectorAll("a").forEach(item => {
        item.addEventListener("click", (e) => {
            e.preventDefault();
            elements.qualityDropdown.querySelectorAll("a").forEach(a => a.classList.remove("active"));
            item.classList.add("active");
            
            const selectedQuality = item.getAttribute("data-val");
            elements.qualityLbl.innerText = selectedQuality;
            
            // Simulated buffering on quality change
            showVideoBufferingFlash();
        });
    });

    // Download Video Action
    elements.videoDownloadBtn.addEventListener("click", triggerLessonDownload);
    
    // Download PDF notes
    elements.notesDownloadBtn.addEventListener("click", () => {
        if (!appState.selectedLesson) return;
        showNotification("Notes Saved", `PDF Revision Notes for "${appState.selectedLesson.title}" downloaded offline.`);
    });
}

function loadLessonsList() {
    const subjectData = COURSE_CATALOG[appState.activeSubject];
    if (!subjectData) return;

    let html = "";
    subjectData.chapters.forEach(chapter => {
        html += `<div class="chapter-header-title">${chapter.title}</div>`;
        chapter.lessons.forEach(lesson => {
            const isUnlocked = lesson.isFree || appState.user.isPremium;
            const isDownloaded = appState.user.downloadedLessons.includes(lesson.id);
            
            let statusIcon = '<i class="fa-solid fa-lock"></i>';
            let iconClass = "locked";
            if (lesson.isFree) {
                statusIcon = '<i class="fa-solid fa-play"></i>';
                iconClass = "free";
            } else if (appState.user.isPremium) {
                statusIcon = '<i class="fa-solid fa-play"></i>';
                iconClass = "unlocked";
            }
            
            const activeClass = appState.selectedLesson && appState.selectedLesson.id === lesson.id ? "active" : "";
            const downloadBadge = isDownloaded ? '<span class="offline-icon-indicator" title="Downloaded offline"><i class="fa-solid fa-circle-check"></i> Offline</span>' : '';
            const freeLabel = lesson.isFree ? '<span class="badge-free">FREE</span>' : '';
            
            html += `
                <div class="lesson-item-card ${activeClass}" data-lesson-id="${lesson.id}">
                    <div class="lesson-status-icon ${iconClass}">
                        ${statusIcon}
                    </div>
                    <div class="lesson-item-info">
                        <h5>${lesson.title}</h5>
                        <div class="lesson-item-meta">
                            <span>${lesson.type === 'video' ? `🎥 Video • ${lesson.duration}` : '📄 Notes'}</span>
                            ${downloadBadge || freeLabel}
                        </div>
                    </div>
                </div>
            `;
        });
    });

    elements.lessonsList.innerHTML = html;

    // Attach click events
    elements.lessonsList.querySelectorAll(".lesson-item-card").forEach(card => {
        card.addEventListener("click", () => {
            const lessonId = card.getAttribute("data-lesson-id");
            selectLesson(lessonId);
        });
    });

    // Default select first lesson if none selected
    if (!appState.selectedLesson && subjectData.chapters[0]?.lessons[0]) {
        selectLesson(subjectData.chapters[0].lessons[0].id);
    }
}

function selectLesson(lessonId) {
    // Find lesson in catalogs
    let foundLesson = null;
    Object.keys(COURSE_CATALOG).forEach(subKey => {
        COURSE_CATALOG[subKey].chapters.forEach(chap => {
            const les = chap.lessons.find(l => l.id === lessonId);
            if (les) foundLesson = les;
        });
    });

    if (!foundLesson) return;
    
    appState.selectedLesson = foundLesson;

    // Update active visual list item
    elements.lessonsList.querySelectorAll(".lesson-item-card").forEach(card => {
        if (card.getAttribute("data-lesson-id") === lessonId) {
            card.classList.add("active");
        } else {
            card.classList.remove("active");
        }
    });

    // Populate metadata
    elements.lessonTitle.innerText = foundLesson.title;
    elements.lessonDesc.innerText = foundLesson.type === 'video' 
        ? `In this structured high-quality animated lesson, we cover all primary curriculum details of Class 10 CBSE Board syllabus regarding this sub-topic.` 
        : `Detailed text-based revision guide designed specifically according to latest CBSE Class 10 marking scheme guidelines.`;
    elements.lessonFreeBadge.style.display = foundLesson.isFree ? "inline-block" : "none";

    // Playback check for Premium vs Free
    const isUnlocked = foundLesson.isFree || appState.user.isPremium;
    
    if (foundLesson.type === 'video') {
        elements.videoPlayerWrapper.style.display = "flex";
        
        if (isUnlocked) {
            elements.videoLockOverlay.classList.add("hidden");
            elements.videoPlayOverlay.classList.remove("hidden");
            elements.videoDownloadBtn.style.opacity = 1;
            elements.videoDownloadBtn.disabled = false;
        } else {
            elements.videoLockOverlay.classList.remove("hidden");
            elements.videoPlayOverlay.classList.add("hidden");
            elements.videoDownloadBtn.style.opacity = 0.5;
            elements.videoDownloadBtn.disabled = true;
            pauseVideo();
        }
        
        resetVideoPlayback();
    } else {
        // Notes layout
        elements.videoPlayerWrapper.style.display = "none";
        pauseVideo();
    }

    // Populate notes content
    if (foundLesson.type === 'note' || NOTES_CONTENT[foundLesson.id]) {
        elements.notesContentArea.innerHTML = NOTES_CONTENT[foundLesson.id] || NOTES_CONTENT["m-1-3"];
    } else {
        elements.notesContentArea.innerHTML = `
            <h4>Syllabus Explanation Transcript for: ${foundLesson.title}</h4>
            <p>Use these study notes as quick revision indicators to supplement the video lecture content. This includes core terminology, formulas, and diagrams tested in Board Exams.</p>
            <ul>
                <li><strong>Core Objective:</strong> Master the definitions, derivations, and formulas corresponding to this lesson.</li>
                <li><strong>CBSE Weightage:</strong> Typically carries 4-6 marks in section B/C of final exam formats.</li>
                <li><strong>Suggested Practice:</strong> Complete the associated Chapter Quiz to earn daily streak rewards.</li>
            </ul>
        `;
    }

    // Sync download button text based on offline cache state
    if (appState.user.downloadedLessons.includes(foundLesson.id)) {
        elements.videoDownloadBtn.innerHTML = '<i class="fa-solid fa-circle-check"></i> <span class="btn-text">Downloaded</span>';
        elements.videoDownloadBtn.style.color = "var(--accent-green)";
    } else {
        elements.videoDownloadBtn.innerHTML = '<i class="fa-solid fa-circle-down"></i> <span class="btn-text">Download</span>';
        elements.videoDownloadBtn.style.color = "white";
    }
}

// 7. CANVAS INTERACTIVE ANIMATOR (Explainer Video Simulation)
// Creates dynamic geometry graphs or circuit drawings on play
function initCanvasAnimator() {
    const ctx = elements.videoCanvas.getContext("2d");
    
    // Fit canvas resolution
    function resizeCanvas() {
        elements.videoCanvas.width = elements.videoCanvas.clientWidth;
        elements.videoCanvas.height = elements.videoCanvas.clientHeight;
    }
    window.addEventListener("resize", resizeCanvas);
    resizeCanvas();

    let angle = 0;
    
    function drawFrame() {
        if (!appState.videoPlaying) return;
        
        ctx.clearRect(0, 0, elements.videoCanvas.width, elements.videoCanvas.height);
        
        const width = elements.videoCanvas.width;
        const height = elements.videoCanvas.height;
        const type = appState.selectedLesson?.videoType || "math-graph";
        
        // Draw standard blackboard overlay grid
        ctx.strokeStyle = "rgba(255,255,255,0.04)";
        ctx.lineWidth = 1;
        const gridSize = 40;
        for (let x = 0; x < width; x += gridSize) {
            ctx.beginPath(); ctx.moveTo(x, 0); ctx.lineTo(x, height); ctx.stroke();
        }
        for (let y = 0; y < height; y += gridSize) {
            ctx.beginPath(); ctx.moveTo(0, y); ctx.lineTo(width, y); ctx.stroke();
        }

        // Render Animated Elements based on lesson type
        if (type === "math-graph") {
            // Draw Cartesian coordinate system
            ctx.strokeStyle = "rgba(255,255,255,0.3)";
            ctx.lineWidth = 2;
            ctx.beginPath();
            ctx.moveTo(width / 2, 20); ctx.lineTo(width / 2, height - 20); // Y Axis
            ctx.moveTo(20, height / 2); ctx.lineTo(width - 20, height / 2); // X Axis
            ctx.stroke();

            // Draw Dynamic Sine/Cosine Curve oscillation (High quality Manim-like render)
            ctx.strokeStyle = "hsl(263, 85%, 65%)";
            ctx.lineWidth = 4;
            ctx.shadowColor = "rgba(124, 58, 237, 0.4)";
            ctx.shadowBlur = 10;
            ctx.beginPath();
            
            for (let x = 30; x < width - 30; x++) {
                const mathX = (x - width / 2) / 40;
                // Cubic Polynomial function simulation: y = x^3 - 3x
                const mathY = Math.sin(mathX + angle) * 2 * Math.cos(mathX * 0.5);
                const screenY = height / 2 - mathY * 40;
                if (x === 30) ctx.moveTo(x, screenY);
                else ctx.lineTo(x, screenY);
            }
            ctx.stroke();
            ctx.shadowBlur = 0; // Reset

            // Interactive labeling nodes
            ctx.fillStyle = "hsl(27, 96%, 60%)";
            ctx.font = "bold 12px sans-serif";
            ctx.fillText("f(x) = sin(x) • cos(0.5x)", width / 2 + 10, 40);
            ctx.fillText("X-Intercept", width / 2 + 60, height / 2 - 10);
            ctx.beginPath();
            ctx.arc(width / 2 + 50, height / 2, 6, 0, Math.PI * 2);
            ctx.fill();

        } else if (type === "science-atom") {
            const centerX = width / 2;
            const centerY = height / 2;

            // Draw electron orbits (ellipses)
            ctx.strokeStyle = "rgba(255,255,255,0.2)";
            ctx.lineWidth = 2;
            
            // Orbit 1
            ctx.beginPath();
            ctx.ellipse(centerX, centerY, 120, 50, Math.PI / 4, 0, Math.PI * 2);
            ctx.stroke();
            
            // Orbit 2
            ctx.beginPath();
            ctx.ellipse(centerX, centerY, 120, 50, -Math.PI / 4, 0, Math.PI * 2);
            ctx.stroke();

            // Draw Atomic Nucleus
            ctx.fillStyle = "hsl(27, 96%, 60%)";
            ctx.beginPath();
            ctx.arc(centerX - 8, centerY - 6, 12, 0, Math.PI * 2);
            ctx.arc(centerX + 8, centerY + 6, 12, 0, Math.PI * 2);
            ctx.fill();
            ctx.fillStyle = "hsl(263, 85%, 60%)";
            ctx.beginPath();
            ctx.arc(centerX + 6, centerY - 8, 12, 0, Math.PI * 2);
            ctx.arc(centerX - 6, centerY + 8, 12, 0, Math.PI * 2);
            ctx.fill();

            // Nucleus Proton labels
            ctx.fillStyle = "white";
            ctx.font = "bold 11px sans-serif";
            ctx.fillText("+", centerX - 10, centerY - 3);

            // Orbiting Electrons
            const eX1 = centerX + Math.cos(angle) * 120 * Math.cos(Math.PI / 4) - Math.sin(angle) * 50 * Math.sin(Math.PI / 4);
            const eY1 = centerY + Math.cos(angle) * 120 * Math.sin(Math.PI / 4) + Math.sin(angle) * 50 * Math.cos(Math.PI / 4);
            
            const eX2 = centerX + Math.cos(-angle * 1.3) * 120 * Math.cos(-Math.PI / 4) - Math.sin(-angle * 1.3) * 50 * Math.sin(-Math.PI / 4);
            const eY2 = centerY + Math.cos(-angle * 1.3) * 120 * Math.sin(-Math.PI / 4) + Math.sin(-angle * 1.3) * 50 * Math.cos(-Math.PI / 4);

            ctx.fillStyle = "hsl(217, 91%, 60%)";
            ctx.beginPath();
            ctx.arc(eX1, eY1, 6, 0, Math.PI * 2);
            ctx.arc(eX2, eY2, 6, 0, Math.PI * 2);
            ctx.fill();

            // Label
            ctx.fillStyle = "#cbd5e1";
            ctx.fillText("Chemical Reaction Simulator: Electron Exchange", 30, 40);

        } else if (type === "science-circuit") {
            // Draw circuit diagram whiteboard animation
            ctx.strokeStyle = "#cbd5e1";
            ctx.lineWidth = 3;
            
            // Border rect representing circuit wires
            ctx.beginPath();
            ctx.moveTo(100, 80);
            ctx.lineTo(width - 100, 80);
            ctx.lineTo(width - 100, height - 80);
            ctx.lineTo(100, height - 80);
            ctx.closePath();
            ctx.stroke();

            // Erase parts to insert components
            ctx.fillStyle = "#0d1117";
            ctx.fillRect(width / 2 - 40, 70, 80, 20); // Resistor spot
            ctx.fillRect(width / 2 - 40, height - 90, 80, 20); // Battery spot
            
            // Draw Resistor zig-zag (Ohm's Law)
            ctx.strokeStyle = "hsl(263, 85%, 65%)";
            ctx.beginPath();
            ctx.moveTo(width / 2 - 40, 80);
            ctx.lineTo(width / 2 - 30, 70);
            ctx.lineTo(width / 2 - 18, 90);
            ctx.lineTo(width / 2 - 6, 70);
            ctx.lineTo(width / 2 + 6, 90);
            ctx.lineTo(width / 2 + 18, 70);
            ctx.lineTo(width / 2 + 30, 90);
            ctx.lineTo(width / 2 + 40, 80);
            ctx.stroke();

            ctx.fillStyle = "white";
            ctx.font = "bold 13px sans-serif";
            ctx.fillText("Resistor (R = 5 Ω)", width / 2 - 50, 50);

            // Draw battery (two parallel lines of different lengths)
            ctx.strokeStyle = "hsl(27, 96%, 60%)";
            ctx.beginPath();
            ctx.moveTo(width / 2 - 20, height - 80);
            ctx.lineTo(width / 2 + 20, height - 80);
            ctx.stroke();
            
            ctx.beginPath();
            ctx.moveTo(width / 2 - 10, height - 90);
            ctx.lineTo(width / 2 - 10, height - 70);
            ctx.moveTo(width / 2, height - 85);
            ctx.lineTo(width / 2, height - 75);
            ctx.moveTo(width / 2 + 10, height - 90);
            ctx.lineTo(width / 2 + 10, height - 70);
            ctx.stroke();

            ctx.fillStyle = "white";
            ctx.fillText("Battery (V = 10V)", width / 2 - 50, height - 40);

            // Ohm's law output formula
            ctx.fillStyle = "hsl(142, 76%, 45%)";
            ctx.fillText("Current I = V/R = 2 Amperes", 40, 45);

            // Animated running current dots (flowing electrons)
            ctx.fillStyle = "hsl(142, 76%, 50%)";
            const flowOffset = (angle * 60) % 200;
            ctx.beginPath();
            ctx.arc(100 + flowOffset, 80, 5, 0, Math.PI * 2);
            ctx.fill();
        } else {
            // Social map simulator
            ctx.fillStyle = "#cbd5e1";
            ctx.font = "bold 14px sans-serif";
            ctx.fillText("Satyagraha Movement Geography Timeline Map", 30, 40);

            // Map contours drawing
            ctx.strokeStyle = "rgba(255,255,255,0.15)";
            ctx.beginPath();
            ctx.moveTo(150, 100);
            ctx.quadraticCurveTo(240, 60, 320, 120);
            ctx.quadraticCurveTo(400, 180, 300, 240);
            ctx.quadraticCurveTo(200, 220, 150, 100);
            ctx.stroke();

            // Interactive Pins
            const pins = [
                { x: 180, y: 110, name: "Champaran (1917)" },
                { x: 230, y: 150, name: "Kheda (1917)" },
                { x: 290, y: 180, name: "Dandi (1930)" }
            ];

            pins.forEach((pin, index) => {
                const scale = (angle + index) % 3 === 0 ? 1.2 : 1;
                ctx.fillStyle = "hsl(27, 96%, 60%)";
                ctx.beginPath();
                ctx.arc(pin.x, pin.y, 6 * scale, 0, Math.PI * 2);
                ctx.fill();
                ctx.fillStyle = "white";
                ctx.font = "10px sans-serif";
                ctx.fillText(pin.name, pin.x + 10, pin.y + 4);
            });
        }

        // Increment phase/angle for smooth movement
        angle += 0.03;
        appState.canvasAnimFrame = requestAnimationFrame(drawFrame);
    }

    drawFrame();
}

function showVideoBufferingFlash() {
    // Canvas buffering flash mockup
    const ctx = elements.videoCanvas.getContext("2d");
    appState.videoPlaying = false;
    
    let bufferTimer = 0;
    const interval = setInterval(() => {
        ctx.fillStyle = "rgba(0,0,0,0.4)";
        ctx.fillRect(0, 0, elements.videoCanvas.width, elements.videoCanvas.height);
        
        ctx.fillStyle = "white";
        ctx.font = "14px sans-serif";
        ctx.fillText("Loading Adaptive Bitrate HLS Stream Segment...", elements.videoCanvas.width / 2 - 120, elements.videoCanvas.height / 2);
        
        bufferTimer++;
        if (bufferTimer > 4) {
            clearInterval(interval);
            appState.videoPlaying = true;
            initCanvasAnimator();
        }
    }, 200);
}

function toggleVideoPlayback() {
    const isUnlocked = appState.selectedLesson?.isFree || appState.user.isPremium;
    if (!isUnlocked) {
        switchView("billing");
        return;
    }

    if (appState.videoPlaying) {
        pauseVideo();
    } else {
        playVideo();
    }
}

function playVideo() {
    appState.videoPlaying = true;
    elements.videoPlayBtn.innerHTML = '<i class="fa-solid fa-pause"></i>';
    elements.videoPlayOverlay.classList.add("hidden");
    
    // Resume animation loop
    initCanvasAnimator();

    // Set duration ticker
    appState.videoInterval = setInterval(() => {
        if (appState.videoCurrentTime < appState.videoDuration) {
            appState.videoCurrentTime++;
            updateVideoSliderUI();
            updateVideoTimerUI();
        } else {
            // Video ended, register progress & streak check
            pauseVideo();
            registerLessonCompleted();
        }
    }, 1000);
}

function pauseVideo() {
    appState.videoPlaying = false;
    elements.videoPlayBtn.innerHTML = '<i class="fa-solid fa-play"></i>';
    elements.videoPlayOverlay.classList.remove("hidden");
    
    clearInterval(appState.videoInterval);
    if (appState.canvasAnimFrame) {
        cancelAnimationFrame(appState.canvasAnimFrame);
    }
}

function resetVideoPlayback() {
    appState.videoCurrentTime = 0;
    updateVideoSliderUI();
    updateVideoTimerUI();
}

function updateVideoSliderUI() {
    const pct = (appState.videoCurrentTime / appState.videoDuration) * 100;
    elements.videoProgressSlider.value = pct;
}

function updateVideoTimerUI() {
    const formatTime = (secs) => {
        const m = Math.floor(secs / 60);
        const s = secs % 60;
        return `${m}:${s < 10 ? '0' : ''}${s}`;
    };
    elements.videoTimeDisplay.innerText = `${formatTime(appState.videoCurrentTime)} / ${formatTime(appState.videoDuration)}`;
}

function registerLessonCompleted() {
    if (!appState.selectedLesson) return;
    
    showNotification("Lesson Completed", `You finished "${appState.selectedLesson.title}". +50 Mastery Points!`);
    
    // Auto increment streak on first activity of the day
    incrementStreak();
}

// 8. OFFLINE DOWNLOAD SIMULATOR
function triggerLessonDownload() {
    if (!appState.selectedLesson) return;
    
    const lessonId = appState.selectedLesson.id;
    if (appState.user.downloadedLessons.includes(lessonId)) {
        // Already downloaded, allow deleting
        appState.user.downloadedLessons = appState.user.downloadedLessons.filter(id => id !== lessonId);
        elements.videoDownloadBtn.innerHTML = '<i class="fa-solid fa-circle-down"></i> <span class="btn-text">Download</span>';
        elements.videoDownloadBtn.style.color = "white";
        showNotification("Cache Cleared", "Video file deleted from local encrypted storage.");
        loadLessonsList();
        return;
    }

    // Trigger downloading process bubble
    elements.downloadBubble.classList.add("visible");
    elements.downloadBubbleTitle.innerText = `Caching: ${appState.selectedLesson.title}`;
    elements.downloadBubblePct.innerText = "0% (Connecting to CDN...)";
    
    let pct = 0;
    const downloadInterval = setInterval(() => {
        pct += 20;
        if (pct === 20) {
            elements.downloadBubblePct.innerText = "20% (Fetching HLS manifest.m3u8)";
        } else if (pct === 60) {
            elements.downloadBubblePct.innerText = "60% (Saving 14 HLS media segments locally)";
        } else if (pct === 80) {
            elements.downloadBubblePct.innerText = "80% (Encrypting segments with AES-128 keys)";
        } else if (pct >= 100) {
            clearInterval(downloadInterval);
            elements.downloadBubble.classList.remove("visible");
            
            // Add to downloaded lists
            appState.user.downloadedLessons.push(lessonId);
            
            // Sync button UI
            elements.videoDownloadBtn.innerHTML = '<i class="fa-solid fa-circle-check"></i> <span class="btn-text">Downloaded</span>';
            elements.videoDownloadBtn.style.color = "var(--accent-green)";
            
            showNotification("Offline Ready", "Video and Notes successfully downloaded for offline access.");
            loadLessonsList();
        }
    }, 600);
}

// 9. DYNAMIC QUIZ SYSTEM
function initQuizView() {
    elements.quizExitBtn.addEventListener("click", () => {
        appState.activeQuiz = null;
        elements.quizIntro.className = "quiz-state-active";
        elements.quizRunning.className = "quiz-state-hidden";
        elements.quizResult.className = "quiz-state-hidden";
    });

    elements.quizRetryBtn.addEventListener("click", () => {
        startQuiz(appState.activeQuiz.id);
    });

    elements.quizDashboardBtn.addEventListener("click", () => {
        switchView("dashboard");
    });

    elements.quizNextBtn.addEventListener("click", () => {
        const selectedOption = elements.quizOptions.querySelector(".option-btn.selected");
        if (!selectedOption) return;
        
        const answerIdx = parseInt(selectedOption.getAttribute("data-index"));
        appState.quizAnswers.push(answerIdx);
        
        appState.quizIndex++;
        
        if (appState.quizIndex < appState.activeQuiz.questions.length) {
            loadQuizQuestion();
        } else {
            finishQuiz();
        }
    });
}

function loadQuizList() {
    let html = "";
    QUIZZES.forEach(quiz => {
        html += `
            <div class="quiz-choice-item" data-quiz-id="${quiz.id}">
                <div class="quiz-info-left">
                    <h4>${quiz.title}</h4>
                    <span>${quiz.questionsCount} Questions • ${quiz.duration} • Subject: ${quiz.subject.toUpperCase()}</span>
                </div>
                <button class="quiz-start-cta">Attempt Quiz</button>
            </div>
        `;
    });
    elements.quizList.innerHTML = html;

    // Attach trigger
    elements.quizList.querySelectorAll(".quiz-choice-item").forEach(item => {
        item.addEventListener("click", () => {
            const quizId = item.getAttribute("data-quiz-id");
            startQuiz(quizId);
        });
    });
}

function startQuiz(quizId) {
    const quiz = QUIZZES.find(q => q.id === quizId);
    if (!quiz) return;

    appState.activeQuiz = quiz;
    appState.quizIndex = 0;
    appState.quizAnswers = [];

    elements.quizIntro.className = "quiz-state-hidden";
    elements.quizRunning.className = "quiz-state-active";
    elements.quizResult.className = "quiz-state-hidden";
    
    elements.quizRunningTitle.innerText = quiz.title;
    elements.quizRunningTag.innerText = quiz.subject.toUpperCase();

    loadQuizQuestion();
}

function loadQuizQuestion() {
    const question = appState.activeQuiz.questions[appState.quizIndex];
    elements.quizQuestionText.innerText = question.q;
    
    // Questions Progress
    elements.quizProgressText.innerText = `Question ${appState.quizIndex + 1} of ${appState.activeQuiz.questions.length}`;
    const progressPct = ((appState.quizIndex) / appState.activeQuiz.questions.length) * 100;
    elements.quizProgressBarFill.style.width = `${progressPct}%`;

    // Disable Next button initially
    elements.quizNextBtn.disabled = true;

    // Populate options
    let html = "";
    question.options.forEach((opt, idx) => {
        html += `
            <button class="option-btn" data-index="${idx}">${opt}</button>
        `;
    });
    elements.quizOptions.innerHTML = html;

    // Click trigger on choices
    elements.quizOptions.querySelectorAll(".option-btn").forEach(btn => {
        btn.addEventListener("click", () => {
            elements.quizOptions.querySelectorAll(".option-btn").forEach(b => b.classList.remove("selected"));
            btn.classList.add("selected");
            elements.quizNextBtn.disabled = false;
        });
    });
}

function finishQuiz() {
    const questions = appState.activeQuiz.questions;
    let correctCount = 0;
    
    questions.forEach((q, idx) => {
        if (appState.quizAnswers[idx] === q.answer) {
            correctCount++;
        }
    });

    const pct = Math.round((correctCount / questions.length) * 100);
    const passed = pct >= 60;

    // Update state & UI
    elements.quizIntro.className = "quiz-state-hidden";
    elements.quizRunning.className = "quiz-state-hidden";
    elements.quizResult.className = "quiz-state-active";

    elements.resScore.innerText = `${correctCount}/${questions.length}`;
    elements.resPercentage.innerText = `${pct}%`;
    elements.resStatus.innerText = passed ? "PASSED" : "FAILED";
    elements.resStatus.className = `res-val ${passed ? 'text-green' : 'text-orange'}`;

    if (passed) {
        elements.resultIconRing.className = "result-icon-ring";
        elements.resultIconRing.innerHTML = '<i class="fa-solid fa-award"></i>';
        elements.resultIconRing.style.backgroundColor = "var(--accent-green-light)";
        elements.resultIconRing.style.color = "var(--accent-green)";
        
        // Dynamic streak reward verification
        incrementStreak();
        elements.quizStreakAlert.style.display = "inline-flex";
    } else {
        elements.resultIconRing.className = "result-icon-ring";
        elements.resultIconRing.innerHTML = '<i class="fa-solid fa-circle-exclamation"></i>';
        elements.resultIconRing.style.backgroundColor = "var(--accent-orange-light)";
        elements.resultIconRing.style.color = "var(--accent-orange)";
        elements.quizStreakAlert.style.display = "none";
    }
}

// 10. BILLING & STRIPE/RAZORPAY PAYWALL CONTROLLER
function initBillingView() {
    elements.startCheckoutBtn.addEventListener("click", openCheckoutModal);
    elements.closeModalBtn.addEventListener("click", closeCheckoutModal);

    // Setup payment method tabs
    elements.paymentTabs.forEach(tab => {
        tab.addEventListener("click", () => {
            elements.paymentTabs.forEach(t => t.classList.remove("active"));
            tab.classList.add("active");

            const method = tab.getAttribute("data-method");
            elements.paymentPanels.forEach(panel => {
                if (panel.id === `panel-${method}`) {
                    panel.classList.add("active");
                } else {
                    panel.classList.remove("active");
                }
            });
        });
    });

    // Mock Pay Confirm Trigger
    elements.payConfirmBtn.addEventListener("click", confirmMockPayment);
}

function openCheckoutModal() {
    elements.paymentModal.classList.remove("hidden");
    elements.paymentSpinner.classList.add("hidden");
    elements.paymentErrorBox.classList.add("hidden");
}

function closeCheckoutModal() {
    elements.paymentModal.classList.add("hidden");
}

function confirmMockPayment() {
    // Show spinner loading overlay
    elements.paymentSpinner.classList.remove("hidden");
    elements.paymentErrorBox.classList.add("hidden");

    // Simulate Secure Gateway processing delay (2.5 seconds)
    setTimeout(() => {
        // Complete mock upgrade
        appState.user.isPremium = true;
        closeCheckoutModal();
        
        // Show success alert
        showNotification("Subscription Active", "Congratulations! 1-Year CBSE Core Premium pass is now active on your account.");
        
        // Sync UI
        elements.userStatusBadge.innerText = "Premium Access";
        elements.userStatusBadge.className = "user-status-badge premium";
        
        elements.billingStatusTag.innerText = "Premium 1-Year Active";
        elements.billingStatusTag.className = "status-indicator-tag status-premium";
        elements.billingStatusDesc.innerText = "Your account is fully upgraded. All math/science explanations, high-quality animations, solved question banks, and offline manifest downloads are unlocked.";
        elements.pricingOfferCard.style.display = "none";
        
        elements.headerUpgradeBtn.classList.add("hidden");

        // Reload views
        if (appState.activeView === "lessons") {
            loadLessonsList();
            if (appState.selectedLesson) {
                selectLesson(appState.selectedLesson.id);
            }
        }
    }, 2500);
}

// 11. GAMIFICATION ENGINE: DAILY STUDY STREAKS
function initGamification() {
    const savedStreak = localStorage.getItem("cbse_streak");
    if (savedStreak) {
        appState.user.streak = parseInt(savedStreak);
    }
    
    updateStreakWidgetUI();
}

function incrementStreak() {
    const today = new Date().toDateString();
    const lastActive = localStorage.getItem("cbse_last_active");

    if (lastActive === today) {
        // Streak already checked in today, do not increment but stay safe
        return;
    }

    // Add logic: if last activity was yesterday, increment. If earlier, reset to 1.
    // For prototype simulation, we just increment it by 1!
    appState.user.streak++;
    localStorage.setItem("cbse_streak", appState.user.streak);
    localStorage.setItem("cbse_last_active", today);
    
    updateStreakWidgetUI();
    showNotification("🔥 Streak Updated", `Daily Study Streak increased to ${appState.user.streak} Days! Keep it up!`);
}

function updateStreakWidgetUI() {
    const streakWidgetCount = elements.streakWidget.querySelector(".streak-count");
    streakWidgetCount.innerText = `${appState.user.streak} Days`;
    
    // Sync streak banners inside views
    const bannerTitle = document.querySelector(".banner-card h2");
    if (bannerTitle) {
        bannerTitle.innerText = `🔥 ${appState.user.streak}-Day Daily Streak!`;
    }
}

// 12. UTILITIES & HELPER POPUPS
function showNotification(title, message) {
    // Generate styled absolute notifications box on the top right
    const box = document.createElement("div");
    box.className = "download-bubble visible";
    box.style.bottom = "auto";
    box.style.top = "30px";
    box.style.right = "30px";
    box.style.backgroundColor = "var(--bg-card)";
    box.style.borderLeft = "4px solid var(--accent-purple)";
    box.style.boxShadow = "var(--shadow-lg)";
    
    box.innerHTML = `
        <div style="font-size: 20px; color: var(--accent-purple);"><i class="fa-solid fa-circle-info"></i></div>
        <div class="download-text-group">
            <h4 style="font-size: 13px; font-weight: 700; margin-bottom: 2px;">${title}</h4>
            <span style="font-size: 11px; color: var(--text-secondary);">${message}</span>
        </div>
    `;

    document.body.appendChild(box);
    setTimeout(() => {
        box.style.opacity = "0";
        box.style.transform = "translateY(-20px)";
        setTimeout(() => box.remove(), 400);
    }, 4000);
}

// Network Online/Offline Handler Simulation
function initOfflineDetection() {
    window.addEventListener("online", updateNetworkStatus);
    window.addEventListener("offline", updateNetworkStatus);

    // Initial check
    updateNetworkStatus();
}

function updateNetworkStatus() {
    appState.isOffline = !navigator.onLine;
    if (appState.isOffline) {
        elements.networkOfflineBadge.classList.remove("offline-hidden");
        showNotification("Offline Mode", "Network disconnected. Playing downloaded courses offline.");
    } else {
        elements.networkOfflineBadge.classList.add("offline-hidden");
    }
}

// 13. MASTER BOOTSTRAPPER
window.addEventListener("DOMContentLoaded", () => {
    initTheme();
    initNavigation();
    initLessonsView();
    initQuizView();
    initBillingView();
    initGamification();
    initOfflineDetection();

    // Default load first item
    switchView("dashboard");
});

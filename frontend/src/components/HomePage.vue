<template>
  <div class="home-container snap-y snap-mandatory h-screen overflow-y-scroll relative">
    <canvas id="canvas-border" class="absolute inset-0 pointer-events-none"></canvas>
    <header class="bg-white shadow snap-start relative z-10">
      <div class="container mx-auto px-4 py-4 flex justify-between items-center">
        <div class="flex items-center">
          <img src="../assets/trustyowl-wide.svg" alt="Trusty Owl" class="h-10 transition-transform duration-500 hover:scale-105 hover:-rotate-2" />
        </div>
        <nav class="hidden md:flex space-x-6">
          <a href="#services" class="text-gray-600 hover:text-blue-600 transition">Services</a>
          <a href="#about" class="text-gray-600 hover:text-blue-600 transition">About</a>
          <a href="#contact" class="text-gray-600 hover:text-blue-600 transition">Contact</a>
        </nav>
        <button class="md:hidden text-gray-600" @click="toggleMobileMenu">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" 
               xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                  d="M4 6h16M4 12h16M4 18h16"></path>
          </svg>
        </button>
      </div>
      <div class="mobile-menu" :class="{'hidden': !isMobileMenuOpen, 'flex flex-col absolute top-full left-0 right-0 bg-white p-4 shadow-md z-40': isMobileMenuOpen}">
        <a href="#services" class="block py-2 hover:bg-gray-100 px-4"
           @click="closeMobileMenu">Services</a>
        <a href="#about" class="block py-2 hover:bg-gray-100 px-4"
           @click="closeMobileMenu">About</a>
        <a href="#contact" class="block py-2 hover:bg-gray-100 px-4"
           @click="closeMobileMenu">Contact</a>
      </div>
    </header>

    <section id="problem" class="min-h-[95vh] py-16 bg-gradient-to-br from-[#f8f9fa] to-[#e3f2fd] snap-start relative z-10">
      <div class="container mx-auto px-6">
        <div class="flex flex-wrap items-center">
          <div class="w-full md:w-1/2 mb-8 md:mb-0">
            <h1 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b] font-['Playfair_Display']">Is Your Business Bogged Down?</h1>
            <p class="text-lg mb-8 font-['Poppins']">Small and medium businesses today face overwhelming operational challenges. Manual processes, disconnected systems, and data silos create inefficiencies that drain your time and resources.</p>
            <div class="space-y-4">
              <div class="flex items-center">
                <div class="w-6 h-6 mr-3 bg-[#ff8a65] rounded-full flex items-center justify-center">
                  <svg viewBox="0 0 24 24" class="w-4 h-4 text-white">
                    <path fill="currentColor" d="M19,13H5V11H19V13Z" />
                  </svg>
                </div>
                <span>Time wasted on repetitive tasks</span>
              </div>
              <div class="flex items-center">
                <div class="w-6 h-6 mr-3 bg-[#ff8a65] rounded-full flex items-center justify-center">
                  <svg viewBox="0 0 24 24" class="w-4 h-4 text-white">
                    <path fill="currentColor" d="M19,13H5V11H19V13Z" />
                  </svg>
                </div>
                <span>Errors from manual data entry</span>
              </div>
              <div class="flex items-center">
                <div class="w-6 h-6 mr-3 bg-[#ff8a65] rounded-full flex items-center justify-center">
                  <svg viewBox="0 0 24 24" class="w-4 h-4 text-white">
                    <path fill="currentColor" d="M19,13H5V11H19V13Z" />
                  </svg>
                </div>
                <span>Missed opportunities from lack of insights</span>
              </div>
            </div>
          </div>
          <div class="w-full md:w-1/2">
            <div class="relative h-96">
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-64 h-64 bg-[#2a4f4b] rounded-full opacity-10"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-56 h-56 bg-[#2a4f4b] rounded-full opacity-20"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-48 h-48 bg-[#2a4f4b] rounded-full opacity-30"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-40 h-40 bg-[#ff8a65] rounded-full flex items-center justify-center">
                  <svg viewBox="0 0 24 24" class="w-24 h-24 text-white">
                    <path fill="currentColor" d="M12,2C6.48,2 2,6.48 2,12C2,17.52 6.48,22 12,22C17.52,22 22,17.52 22,12C22,6.48 17.52,2 12,2M12,20C7.59,20 4,16.41 4,12C4,7.59 7.59,4 12,4C16.41,4 20,7.59 20,12C20,16.41 16.41,20 12,20M13,12V7H11V13H17V11H13Z" />
                  </svg>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="guide" class="min-h-[95vh] py-16 bg-gradient-to-br from-[#e3f2fd] to-white snap-start relative z-10">
      <div class="container mx-auto px-6">
        <div class="flex flex-wrap items-center">
          <div class="w-full md:w-1/2 mb-8 md:mb-0 order-2 md:order-1">
            <div class="relative h-96">
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="transition-transform duration-500 hover:scale-105 hover:-rotate-5 w-64 h-64 bg-gradient-to-br from-[#2a4f4b] to-[#4db6ac] rounded-full flex items-center justify-center shadow-xl">
                  <svg viewBox="0 0 24 24" class="w-32 h-32 text-white animate-pulse">
                    <path fill="currentColor" d="M12,17C10.89,17 10,16.1 10,15C10,13.89 10.89,13 12,13C13.1,13 14,13.9 14,15C14,16.1 13.1,17 12,17M18,15.22C18,14.1 18.25,13.03 18.68,12.05L19.86,8.93C19.94,8.68 20,8.4 20,8.09C20,6.94 19.08,6 17.93,6H6.07C4.92,6 4,6.94 4,8.09C4,8.4 4.06,8.68 4.14,8.93L5.32,12.05C5.75,13.03 6,14.1 6,15.22V17A2,2 0 0,1 4,19V20A1,1 0 0,0 5,21H19A1,1 0 0,0 20,20V19A2,2 0 0,1 18,17V15.22M12,6C10.5,6 9.15,6.67 8.24,7.76L9.66,9.17C10.28,8.42 11.11,8 12,8C12.89,8 13.72,8.42 14.34,9.17L15.76,7.76C14.85,6.67 13.5,6 12,6Z" />
                  </svg>
                </div>
              </div>
            </div>
          </div>
          <div class="w-full md:w-1/2 order-1 md:order-2">
            <h2 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b] font-['Playfair_Display']">Meet Trusty Owl: Your Guide to Smarter Business</h2>
            <p class="text-lg mb-8 font-['Poppins']">In the complex forest of business operations, you need a wise guide. Trusty Owl combines deep expertise with innovative technology to help SMBs navigate challenges and soar to new heights.</p>
            <div class="flex items-center">
              <div class="w-12 h-12 mr-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                  <path fill="currentColor" d="M12,2L4,12L12,22L20,12L12,2Z" />
                </svg>
              </div>
              <p class="font-semibold">Trusted by businesses across industries</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="services" class="min-h-[95vh] py-16 bg-gradient-to-br from-white to-[#f0f4f8] snap-start relative z-10">
      <div class="container mx-auto px-6">
        <div class="flex flex-wrap items-center">
          <div class="w-full md:w-1/2 mb-8 md:mb-0">
            <h2 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b] font-['Playfair_Display']">Unlock Efficiency with Workflow Automation</h2>
            <p class="text-lg mb-8 font-['Poppins']">Transform your manual processes into streamlined workflows that save time, reduce errors, and free your team to focus on what matters most.</p>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div class="bg-white p-6 rounded-lg shadow-sm">
                <div class="w-10 h-10 mb-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                  <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                    <path fill="currentColor" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                  </svg>
                </div>
                <h3 class="font-bold mb-2">Process Optimization</h3>
                <p class="text-sm">Identify and automate repetitive tasks to maximize efficiency.</p>
              </div>
              <div class="bg-white p-6 rounded-lg shadow-sm">
                <div class="w-10 h-10 mb-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                  <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                    <path fill="currentColor" d="M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                  </svg>
                </div>
                <h3 class="font-bold mb-2">Error Reduction</h3>
                <p class="text-sm">Minimize human error with automated data handling.</p>
              </div>
            </div>
          </div>
          <div class="w-full md:w-1/2">
            <div class="relative h-96">
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-64 h-64 bg-[#4db6ac] rounded-full opacity-10"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-56 h-56 bg-[#4db6ac] rounded-full opacity-20"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-48 h-48 bg-[#4db6ac] rounded-full opacity-30"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="relative w-40 h-40">
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                    <svg viewBox="0 0 24 24" class="w-32 h-32 text-[#2a4f4b] animate-spin" style="animation-duration: 20s">
                      <path fill="currentColor" d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                    </svg>
                  </div>
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                    <svg viewBox="0 0 24 24" class="w-16 h-16 text-[#ff8a65] animate-spin" style="animation-duration: 20s; animation-direction: reverse;">
                      <path fill="currentColor" d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="ai" class="min-h-[95vh] py-16 bg-gradient-to-br from-[#f0f4f8] to-white snap-start relative z-10">
      <div class="container mx-auto px-6">
        <div class="flex flex-wrap items-center">
          <div class="w-full md:w-1/2 mb-8 md:mb-0 order-2 md:order-1">
            <div class="relative h-96">
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-64 h-64 bg-[#fbc02d] rounded-full opacity-10"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-56 h-56 bg-[#fbc02d] rounded-full opacity-20"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-48 h-48 bg-[#fbc02d] rounded-full opacity-30"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="relative w-40 h-40">
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                    <svg viewBox="0 0 24 24" class="w-32 h-32 text-[#2a4f4b] animate-bounce" style="animation-duration: 6s">
                      <path fill="currentColor" d="M12,3A9,9 0 0,0 3,12A9,9 0 0,0 12,21A9,9 0 0,0 21,12A9,9 0 0,0 12,3M12,19A7,7 0 0,1 5,12A7,7 0 0,1 12,5A7,7 0 0,1 19,12A7,7 0 0,1 12,19M12.5,11H11V7H13V9.3L14.5,7.1L16,9.3L13.5,11H12.5Z" />
                    </svg>
                  </div>
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                    <div class="w-16 h-16 bg-[#4db6ac] rounded-full flex items-center justify-center animate-pulse">
                      <svg viewBox="0 0 24 24" class="w-10 h-10 text-white">
                        <path fill="currentColor" d="M21,16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V7.5C3,7.12 3.21,6.79 3.53,6.62L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.79,6.79 21,7.12 21,7.5V16.5M12,4.15L5,8.09V15.91L12,19.85L19,15.91V8.09L12,4.15Z" />
                      </svg>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="w-full md:w-1/2 order-1 md:order-2">
            <h2 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b] font-['Playfair_Display']">Make Smarter Decisions with AI Integration</h2>
            <p class="text-lg mb-8 font-['Poppins']">We make artificial intelligence accessible and actionable for SMBs, turning your data into strategic insights that drive growth.</p>
            <div class="space-y-6">
              <div class="flex items-start">
                <div class="w-10 h-10 mr-4 bg-[#fbc02d] rounded-full flex items-center justify-center mt-1 flex-shrink-0">
                  <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                    <path fill="currentColor" d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                  </svg>
                </div>
                <div>
                  <h3 class="font-bold mb-2">Predictive Analytics</h3>
                  <p>Anticipate trends and customer needs before they emerge.</p>
                </div>
              </div>
              <div class="flex items-start">
                <div class="w-10 h-10 mr-4 bg-[#fbc02d] rounded-full flex items-center justify-center mt-1 flex-shrink-0">
                  <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                    <path fill="currentColor" d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                  </svg>
                </div>
                <div>
                  <h3 class="font-bold mb-2">Customer Insights</h3>
                  <p>Understand your customers at a deeper level to serve them better.</p>
                </div>
              </div>
              <div class="flex items-start">
                <div class="w-10 h-10 mr-4 bg-[#fbc02d] rounded-full flex items-center justify-center mt-1 flex-shrink-0">
                  <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                    <path fill="currentColor" d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                  </svg>
                </div>
                <div>
                  <h3 class="font-bold mb-2">Operational Intelligence</h3>
                  <p>Identify bottlenecks and opportunities in your workflows.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="transform" class="min-h-[95vh] py-16 bg-gradient-to-br from-white to-[#e3f2fd] snap-start relative z-10">
      <div class="container mx-auto px-6">
        <div class="flex flex-wrap items-center">
          <div class="w-full md:w-1/2 mb-8 md:mb-0">
            <h2 class="text-4xl md:text-5xl font-bold mb-6 text-[#2a4f4b] font-['Playfair_Display']">Transform Your Operations, Grow Your Business</h2>
            <p class="text-lg mb-8 font-['Poppins']">By combining workflow automation with AI-powered insights, Trusty Owl helps businesses like yours achieve remarkable transformations.</p>
            <div class="bg-white p-6 rounded-lg shadow-sm mb-6">
              <div class="flex items-center mb-4">
                <div class="w-10 h-10 mr-4 bg-[#4db6ac] rounded-full flex items-center justify-center flex-shrink-0">
                  <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                    <path fill="currentColor" d="M13,2.03V2.05L13,4.05C17.39,4.59 20.5,8.58 19.96,12.97C19.5,16.61 16.64,19.5 13,19.93V21.93C18.5,21.38 22.5,16.5 21.95,11C21.5,6.25 17.73,2.5 13,2.03M11,2.06C9.05,2.25 7.19,3 5.67,4.26L7.1,5.74C8.22,4.84 9.57,4.26 11,4.06V2.06M4.26,5.67C3,7.19 2.25,9.04 2.05,11H4.05C4.24,9.58 4.8,8.23 5.69,7.1L4.26,5.67M2.06,13C2.26,14.96 3.03,16.81 4.27,18.33L5.69,16.9C4.81,15.77 4.24,14.42 4.06,13H2.06M7.1,18.37L5.67,19.74C7.18,21 9.04,21.79 11,22V20C9.58,19.82 8.23,19.25 7.1,18.37M12.5,7V12.25L17,14.33L16.28,15.54L11,13V7H12.5Z" />
                  </svg>
                </div>
                <h3 class="text-xl font-bold">Typical Results</h3>
              </div>
              <div class="grid grid-cols-3 gap-4 text-center">
                <div>
                  <div class="text-2xl font-bold text-[#4db6ac]">40-60%</div>
                  <div class="text-sm">Time Savings</div>
                </div>
                <div>
                  <div class="text-2xl font-bold text-[#4db6ac]">30-50%</div>
                  <div class="text-sm">Error Reduction</div>
                </div>
                <div>
                  <div class="text-2xl font-bold text-[#4db6ac]">20-35%</div>
                  <div class="text-sm">Revenue Growth</div>
                </div>
              </div>
            </div>
          </div>
          <div class="w-full md:w-1/2">
            <div class="relative h-96">
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-64 h-64 bg-[#4db6ac] rounded-full opacity-10"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-56 h-56 bg-[#4db6ac] rounded-full opacity-20"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="w-48 h-48 bg-[#4db6ac] rounded-full opacity-30"></div>
              </div>
              <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                <div class="relative w-40 h-40">
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                    <svg viewBox="0 0 24 24" class="w-32 h-32 text-[#2a4f4b]">
                      <path fill="currentColor" d="M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2M11,16.5L18,9.5L16.5,8L11,13.5L7.5,10L6,11.5L11,16.5Z" />
                    </svg>
                  </div>
                  <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center">
                    <svg viewBox="0 0 24 24" class="w-16 h-16 text-[#fbc02d]">
                      <path fill="currentColor" d="M12,17.27L18.18,21L16.54,13.97L22,9.24L14.81,8.62L12,2L9.19,8.62L2,9.24L7.45,13.97L5.82,21L12,17.27Z" />
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="contact" class="min-h-[95vh] py-16 bg-gradient-to-br from-[#e3f2fd] to-[#2a4f4b] text-white snap-start relative z-10">
      <div class="container mx-auto px-6 py-12">
        <div class="max-w-4xl mx-auto text-center">
          <h2 class="text-4xl md:text-5xl font-bold mb-8 font-['Playfair_Display']">Ready to Streamline Your Success?</h2>
          <p class="text-xl mb-12 font-['Poppins']">Let's discuss how Trusty Owl can help your business work smarter, not harder.</p>
          
          <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
            <div class="bg-white bg-opacity-10 p-6 rounded-lg backdrop-filter backdrop-blur-sm">
              <div class="w-12 h-12 mx-auto mb-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                  <path fill="currentColor" d="M22 6C22 4.9 21.1 4 20 4H4C2.9 4 2 4.9 2 6V18C2 19.1 2.9 20 4 20H20C21.1 20 22 19.1 22 18V6M20 6L12 11L4 6H20M20 18H4V8L12 13L20 8V18Z" />
                </svg>
              </div>
              <h3 class="text-xl font-bold mb-2">Email Us</h3>
              <a href="mailto:info@trustyowl.com" class="hover:text-[#4db6ac] transition">info@trustyowl.com</a>
            </div>
            <div class="bg-white bg-opacity-10 p-6 rounded-lg backdrop-filter backdrop-blur-sm">
              <div class="w-12 h-12 mx-auto mb-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                  <path fill="currentColor" d="M6.62,10.79C8.06,13.62 10.38,15.94 13.21,17.38L15.41,15.18C15.69,14.9 16.08,14.82 16.43,14.93C17.55,15.3 18.75,15.5 20,15.5A1,1 0 0,1 21,16.5V20A1,1 0 0,1 20,21A17,17 0 0,1 3,4A1,1 0 0,1 4,3H7.5A1,1 0 0,1 8.5,4C8.5,5.25 8.7,6.45 9.07,7.57C9.18,7.92 9.1,8.31 8.82,8.59L6.62,10.79Z" />
                </svg>
              </div>
              <h3 class="text-xl font-bold mb-2">Call Us</h3>
              <p>(555) 123-4567</p>
            </div>
            <div class="bg-white bg-opacity-10 p-6 rounded-lg backdrop-filter backdrop-blur-sm">
              <div class="w-12 h-12 mx-auto mb-4 bg-[#4db6ac] rounded-full flex items-center justify-center">
                <svg viewBox="0 0 24 24" class="w-6 h-6 text-white">
                  <path fill="currentColor" d="M12,11.5A2.5,2.5 0 0,1 9.5,9A2.5,2.5 0 0,1 12,6.5A2.5,2.5 0 0,1 14.5,9A2.5,2.5 0 0,1 12,11.5M12,2A7,7 0 0,0 5,9C5,14.25 12,22 12,22C12,22 19,14.25 19,9A7,7 0 0,0 12,2Z" />
                </svg>
              </div>
              <h3 class="text-xl font-bold mb-2">Visit Us</h3>
              <p>Colorado Springs, CO</p>
            </div>
          </div>
          
          <div class="flex justify-center mb-12">
            <a href="mailto:info@trustyowl.com" class="bg-[#4db6ac] hover:bg-[#3da89e] text-white font-bold py-3 px-8 rounded-full text-lg transition duration-300 transform hover:scale-105 shadow-lg">
              Contact Us
            </a>
          </div>
          
          <div class="border-t border-white border-opacity-20 pt-8">
            <div class="flex justify-center space-x-8 mb-6">
              <router-link to="/privacy" class="hover:text-[#4db6ac] transition">Privacy Policy</router-link>
              <router-link to="/terms" class="hover:text-[#4db6ac] transition">Terms & Conditions</router-link>
            </div>
            <p class="text-sm opacity-70">© {{ new Date().getFullYear() }} Trusty Owl. All Rights Reserved.</p>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import Granim from 'granim';

const isMobileMenuOpen = ref(false);

function toggleMobileMenu() {
  isMobileMenuOpen.value = !isMobileMenuOpen.value;
}

function closeMobileMenu() {
  isMobileMenuOpen.value = false;
}

onMounted(() => {
  const granimInstance = new Granim({
    element: '#canvas-border',
    direction: 'diagonal', // Changed to diagonal for better visibility
    isPausedWhenNotInView: false, // Ensure it runs even when not in view
    states: {
      "default-state": {
        gradients: [
          ['#ff7e5f', '#feb47b'], // Warm gradient
          ['#6a11cb', '#2575fc'], // Cool gradient
          ['#43cea2', '#185a9d']  // Green-blue gradient
        ],
        transitionSpeed: 2000 // Smooth transition
      }
    }
  });

  // Debugging: Log if the instance is created
  console.log('Granim instance created:', granimInstance);
});
</script>

<style>
/* Add snapping behavior */
.home-container {
  scroll-snap-type: y mandatory;
}

.snap-start {
  scroll-snap-align: start;
}

/* Canvas for gradient border */
#canvas-border {
  position: absolute;
  display: block;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  pointer-events: none;
  z-index: 1;
}

@keyframes float {
  0% { transform: translateY(0px); }
  50% { transform: translateY(-20px); }
  100% { transform: translateY(0px); }
}

.animate-float {
  animation: float 6s ease-in-out infinite;
}

@keyframes blink {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.8; }
}

.animate-blink {
  animation: blink 5s infinite;
}

.animate-spin {
  animation: spin 20s linear infinite;
}

@keyframes spin {
  100% { transform: rotate(360deg); }
}

.animate-spin-reverse {
  animation: spin-reverse 20s linear infinite;
}

@keyframes spin-reverse {
  100% { transform: rotate(-360deg); }
}

.animate-pulse {
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0% { transform: scale(1); }
  50% { transform: scale(1.05); }
  100% { transform: scale(1); }
}
</style>
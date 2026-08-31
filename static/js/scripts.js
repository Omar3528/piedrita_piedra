/* =========================================================
   CESETEK — scripts.js
   Vanilla JS: solo diseño / animación de interfaz.
   No hay lógica de autenticación, pagos ni backend real.
   ========================================================= */

document.addEventListener('DOMContentLoaded', () => {

  /* ---------- 1. Navbar: encoger + sombra al hacer scroll ---------- */
  const navbar = document.getElementById('navbar');
  const onScroll = () => {
    navbar.classList.toggle('scrolled', window.scrollY > 12);
  };
  onScroll();
  window.addEventListener('scroll', onScroll, { passive: true });

  /* ---------- 2. Menú móvil ---------- */
  const navToggle = document.getElementById('navToggle');
  const navLinks  = document.getElementById('navLinks');
  const navAuth   = document.querySelector('.nav-auth');

  navToggle.addEventListener('click', () => {
    const isOpen = navLinks.classList.toggle('open');
    navAuth.classList.toggle('open', isOpen);
    navToggle.setAttribute('aria-expanded', String(isOpen));
    navToggle.classList.toggle('is-active', isOpen);
  });

  // cerrar el menú móvil al elegir un enlace
  navLinks.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      navLinks.classList.remove('open');
      navAuth.classList.remove('open');
      navToggle.setAttribute('aria-expanded', 'false');
    });
  });

  /* ---------- 3. Scroll reveal con IntersectionObserver ---------- */
  const revealEls = document.querySelectorAll('.reveal');

  if ('IntersectionObserver' in window) {
    const revealObserver = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-visible');
          revealObserver.unobserve(entry.target);
        }
      });
    }, { threshold: 0.15, rootMargin: '0px 0px -40px 0px' });

    revealEls.forEach(el => revealObserver.observe(el));
  } else {
    // Fallback: si el navegador no soporta IntersectionObserver, mostrar todo
    revealEls.forEach(el => el.classList.add('is-visible'));
  }

  /* ---------- 4. Conteo animado de cifras (aside del hero) ---------- */
  const statNums = document.querySelectorAll('.stat-num');

  const animateCount = (el) => {
    const target = parseInt(el.dataset.count, 10) || 0;
    const duration = 1400;
    const start = performance.now();

    const step = (now) => {
      const progress = Math.min((now - start) / duration, 1);
      // easeOutCubic
      const eased = 1 - Math.pow(1 - progress, 3);
      el.textContent = Math.floor(eased * target);
      if (progress < 1) requestAnimationFrame(step);
      else el.textContent = target;
    };
    requestAnimationFrame(step);
  };

  if ('IntersectionObserver' in window && statNums.length) {
    const statObserver = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          animateCount(entry.target);
          statObserver.unobserve(entry.target);
        }
      });
    }, { threshold: 0.6 });

    statNums.forEach(el => statObserver.observe(el));
  }

  /* ---------- 5. Secuencia del escáner de credencial (hero) ---------- */
  const statusLed  = document.getElementById('statusLed');
  const statusText = document.getElementById('statusText');

  if (statusLed && statusText) {
    const cycle = () => {
      // fase 1: en espera
      statusLed.classList.remove('granted', 'checking');
      statusText.textContent = 'EN ESPERA';

      setTimeout(() => {
        // fase 2: verificando (coincide con el barrido del beam)
        statusLed.classList.add('checking');
        statusText.textContent = 'VERIFICANDO…';
      }, 900);

      setTimeout(() => {
        // fase 3: acceso concedido
        statusLed.classList.remove('checking');
        statusLed.classList.add('granted');
        statusText.textContent = 'ACCESO CONCEDIDO';
      }, 1900);
    };

    cycle();
    setInterval(cycle, 2600); // misma duración que la animación CSS del beam
  }

  /* ---------- 6. Personalizador de playera (solo vista previa visual) ---------- */
  const swatches = document.querySelectorAll('.swatch');
  const shirtSvg = document.getElementById('shirtSvg');

  if (swatches.length && shirtSvg) {
    swatches[0].classList.add('active');

    swatches.forEach(btn => {
      btn.addEventListener('click', () => {
        const color = btn.dataset.color;
        shirtSvg.style.setProperty('--shirt-color', color);
        swatches.forEach(s => s.classList.remove('active'));
        btn.classList.add('active');

        // pequeño "pulso" visual al cambiar de color
        shirtSvg.animate(
          [{ filter: 'brightness(1.4)' }, { filter: 'brightness(1)' }],
          { duration: 350, easing: 'ease-out' }
        );
      });
    });
  }

  /* ---------- 7. Botón "volver arriba" ---------- */
  const backToTop = document.getElementById('backToTop');
  if (backToTop) {
    backToTop.addEventListener('click', () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  /* ---------- 8. Newsletter: solo feedback visual, sin envío real ---------- */
  const newsletterForm = document.getElementById('newsletterForm');
  if (newsletterForm) {
    newsletterForm.addEventListener('submit', (e) => {
      e.preventDefault();
      const button = newsletterForm.querySelector('button');
      const original = button.textContent;
      button.textContent = '¡Gracias!';
      button.disabled = true;
      setTimeout(() => {
        button.textContent = original;
        button.disabled = false;
        newsletterForm.reset();
      }, 2200);
    });
  }

  /* ---------- 9. Año dinámico en el footer ---------- */
  const yearEl = document.getElementById('year');
  if (yearEl) yearEl.textContent = new Date().getFullYear();

  /* ---------- 10. Modales de acceso: iniciar sesión / registrarse ----------
     Usa los componentes Modal de Bootstrap (bootstrap.bundle.min.js).
     Solo maneja UI: cambio entre modales y feedback de envío,
     sin lógica real de autenticación. ---------------------------------- */
  const loginModalEl    = document.getElementById('loginModal');
  const registerModalEl = document.getElementById('registerModal');

  if (window.bootstrap && loginModalEl && registerModalEl) {
    const loginModal    = bootstrap.Modal.getOrCreateInstance(loginModalEl);
    const registerModal = bootstrap.Modal.getOrCreateInstance(registerModalEl);

    // helper: cierra un modal y, cuando termina la transición, abre el otro
    const switchModal = (fromEl, fromModal, toModal) => {
      fromEl.addEventListener('hidden.bs.modal', () => toModal.show(), { once: true });
      fromModal.hide();
    };

    const goToRegister = document.getElementById('goToRegister');
    const goToLogin    = document.getElementById('goToLogin');

    if (goToRegister) {
      goToRegister.addEventListener('click', (e) => {
        e.preventDefault();
        switchModal(loginModalEl, loginModal, registerModal);
      });
    }
    if (goToLogin) {
      goToLogin.addEventListener('click', (e) => {
        e.preventDefault();
        switchModal(registerModalEl, registerModal, loginModal);
      });
    }

    // feedback visual de envío (sin backend real)
    const handleAuthSubmit = (form, modal, modalEl, successText) => {
      if (!form) return;
      form.addEventListener('submit', (e) => {
        e.preventDefault();
        if (!form.checkValidity()) {
          form.reportValidity();
          return;
        }
        const button = form.querySelector('button[type="submit"]');
        const original = button.innerHTML;
        button.disabled = true;
        button.innerHTML = '<i class="fa-solid fa-circle-notch fa-spin"></i> Procesando…';

        setTimeout(() => {
          button.innerHTML = `<i class="fa-solid fa-circle-check"></i> ${successText}`;
          setTimeout(() => {
            modal.hide();
            form.reset();
            button.disabled = false;
            button.innerHTML = original;
          }, 900);
        }, 1000);
      });
    };

    handleAuthSubmit(document.getElementById('loginForm'), loginModal, loginModalEl, '¡Bienvenido!');
    handleAuthSubmit(document.getElementById('registerForm'), registerModal, registerModalEl, '¡Cuenta creada!');
  }

});
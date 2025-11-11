// Method card selection
document.querySelectorAll('.method-card').forEach(card => {
    card.addEventListener('click', function () {
        document.querySelectorAll('.method-card').forEach(c => c.classList.remove('selected'));
        this.classList.add('selected');
    });
});

// Smooth scroll for sidebar links
document.querySelectorAll('.sidebar-menu a').forEach(link => {
    link.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelectorAll('.sidebar-menu a').forEach(l => l.classList.remove('active'));
        this.classList.add('active');

        const target = document.querySelector(this.getAttribute('href'));
        target.scrollIntoView({ behavior: 'smooth', block: 'start' });
    });
});

const sections = document.querySelectorAll('.section');
const menuLinks = document.querySelectorAll('.sidebar-menu a');

function highlightMenu() {
    let scrollPosition = window.scrollY + 150;

    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.offsetHeight;
        const sectionId = section.getAttribute('id');

        if (scrollPosition >= sectionTop && scrollPosition < sectionTop + sectionHeight) {
            menuLinks.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === '#' + sectionId) {
                    link.classList.add('active');
                }
            });
        }
    });
}

window.addEventListener('scroll', highlightMenu);
highlightMenu(); // Run on page load
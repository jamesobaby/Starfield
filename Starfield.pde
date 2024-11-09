// Array of Particle objects
Particle[] particles = new Particle[100]; 

void setup() {
    size(800, 600); // Canvas size
    // Initialize particles array
    for (int i = 0; i < particles.length; i++) {
        if (i == 0) {
            particles[i] = new OddballParticle(); // First particle is an OddballParticle
        } else {
            particles[i] = new Particle(); // Rest are regular Particles
        }
    }
}

void draw() {
    background(0); // Black background
    // Move and show each particle
    for (Particle p : particles) {
        p.move();
        p.show();
    }
}

// Particle class definition
class Particle {
    double x, y;         // Position
    double angle, speed; // Movement properties
    color particleColor; // Particle color

    Particle() {
        x = random(width); // Random x within screen
        y = random(height); // Random y within screen
        angle = random(TWO_PI); // Random direction
        speed = random(1, 3); // Random speed between 1 and 3
        particleColor = color(random(255), random(255), random(255)); // Random color
    }

    void move() {
        x += cos((float) angle) * speed; // Cast angle to float for cos()
        y += sin((float) angle) * speed; // Cast angle to float for sin()

        // Wrap around edges
        if (x < 0) x = width;
        if (x > width) x = 0;
        if (y < 0) y = height;
        if (y > height) y = 0;
    }

    void show() {
        fill(particleColor);
        noStroke();
        ellipse((float) x, (float) y, 10, 10); // Draw as a circle
    }
}

// OddballParticle class extending Particle
class OddballParticle extends Particle {

    OddballParticle() {
        super(); // Call Particle constructor
        particleColor = color(255, 0, 0); // Distinct color for Oddball
    }

    void move() {
        x += cos((float) angle) * speed * 2; // Faster movement, cast angle to float
        y += sin((float) angle) * speed * 2;

        // Wrap around edges
        if (x < 0) x = width;
        if (x > width) x = 0;
        if (y < 0) y = height;
        if (y > height) y = 0;
    }

    void show() {
        fill(particleColor);
        noStroke();
        ellipse((float) x, (float) y, 15, 15); // Larger size for Oddball
    }
}

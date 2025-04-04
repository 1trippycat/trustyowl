import React from 'react';
import Header from '../components/Header';
import LeadForm from '../components/LeadForm';
import Footer from '../components/Footer';

const Home = () => {
    return (
        <div>
            <Header />
            <main>
                <h1>Welcome to Trusty Owl</h1>
                <p>Automate your day-to-day operations and leverage AI to scale your business.</p>
                <LeadForm />
            </main>
            <Footer />
        </div>
    );
};

export default Home;
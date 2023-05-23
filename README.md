# Inpedence-control-with-force-tracking-for-fiber-pulling

In this work, we propose a novel biomimetic robotic fiber threading approach based on impedance control with force tracking. The highly integrated approach can control the impedance of the fiber during both threading and solidification of the fiber and characterize the mechanical properties of the fabricated fibers in the very same setup without changing parts. The impedance control method has also been adapted in this paper by adding a real-time estimator for continuously estimating the stiffness of the threading force for highly accurate control. The resulted fibers using the proposed approach demonstrates higher performances in all terms of toughness, stiffness, elongation and strength, compared to the traditional velocity controlled fiber fabrication approach.

Experiental setup

To implement impedance control with force tracking for our robotic threading (gel pulling), the experimental setup shown in Figure 1 is employed. The setup, placed on a vibration isolation table, consists of a dispenser (Nordson EFD, model Performus V) held on a motorized precision positioner (Physik Instrumente, model M404.4PD) to dispense and pull the gel. In the rest of the paper, the dispenser with the precision positioner is called robot manipulator. A needle is held on a force sensor (LCM Systems, model LCM UF1), which is fixed, to sense the pulling force after contacting the gel-like substance. The motorized precision positioner is controlled via a controller (Physik Instrumente, model C-884.4CD) using Matlab/Simulink. The measurement of the force sensor is acquired using a data acquisition (DAQ) board (National Instrument, model PCIe-6363). The dispenser is controlled also via the DAQ board.
In the experiments, a commercial fast-curing contact adhesive (Pattex), which is a solvent based polychloroprene rubber, is used to generate artificial fibers by pulling.

![image](https://github.com/HouariBettahar/Inpedence-control-with-force-tracking-for-fiber-pulling/assets/134390508/0e37ca9c-7d0b-4455-a3ca-5e6c6fedc6f7)

Figure 1: Robotic experimental setup. The gel dispenser is fixed on a motorized precision positioner, where the force sensor is fixed.

 Experiental protocol
 
The proposed method for pulling fibers is a multi-step process:

The first step entails inserting the force sensor into   material droplet extruded by the dispenser. This allows for the measurement of the pulling force during the fiber pulling process.

In the second step, the fiber pulling process takes place. The material is extracted from the dispenser tube using the motorized precision positioner, while simultaneously measuring the pulling force with the force sensor. This step transforms the  material from a liquid state to a semi-solid state, forming a fiber.

The third step is the solidification phase. During this phase, the motorized precision positioner remains stationary for a specified duration, allowing the fiber to solidify. The solidification force is measured during this phase, which is crucial for determining the tensile properties.

during pulling and solidification, the force has was controlled based on impedance control with force tracking. The impedance control establishes a user-defined relationship between the position of the manipulator and the force sensor, enabling control of the pulling force based on a mass-spring-damper system (see Figure 2). The stiffness, viscosity, and mass of the  fiber change over time during the hardening process, so an online estimation method is employed to estimate the stiffness during this phase.

![image](https://github.com/HouariBettahar/Inpedence-control-with-force-tracking-for-fiber-pulling/assets/134390508/79b01bd5-8ed7-4c27-933d-bd73f5e76acd)

Figure 2: Fiber threading system model based on mass-spring-damper: (a) just at contact f_g=0 and (b) contact with f_g≠0.

![image](https://github.com/HouariBettahar/Inpedence-control-with-force-tracking-for-fiber-pulling/assets/134390508/bae454e8-e167-4c1b-81ac-53721d40ffad)

Figure 3: The impedance control with force tracking control scheme applied on fiber threading during the fabrication phase.


In the experiments, a force control scheme (see Figure 3) was implemented with a sampling frequency of 100 Hz. The control scheme was evaluated using an experimental setup described in the document. The PID parameters of the position controller and the target impedance were tuned using a trial-and-error method to achieve the desired force performance, including time response, accuracy, and overshoot cancellation.

During the solidification phase, the force from the hardening process can be detected. The estimation of stiffness begins at this point, and an impedance controller is used to track a force reference. The stiffness of the Dextran fiber is continuously estimated during the control process.

In the subsequent fiber characterization step, the tensile properties of the fabricated fiber are evaluated through a tensile test. This involves pulling the same fiber that was previously fabricated using the same device, without removing the fiber, while recording the applied force. 

The research described in this document has been published in IEEE Robotics and Automation Letters. For a more comprehensive discussion and detailed information, I recommend accessing the paper through the provided link: 

https://www.researchgate.net/publication/354977614_Robotic_Fiber_Threading_from_a_Gel-like_Substance_Based_on_Impedance_Control_with_Force_Tracking

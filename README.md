# Assembly Based Keylogger

This repository contains a basic keylogger written in x86 Assembly using the Irvine32 library. It demonstrates how keystrokes can be captured and stored using a low-level interrupt-based approach.

**Important:** This project is intended solely for educational and research purposes. Unauthorized monitoring of systems or users is illegal and unethical. Do not use this tool without clear consent.

---
## Requirements

To build and run this project, you’ll need:

- A 32-bit Windows environment
- Microsoft Visual Studio with MASM support
- Irvine32 library by Kip Irvine (properly set up in your project)

---

## Overview

This program performs the following operations:

1. Opens or creates a log file (`keylog.txt`)
2. Hooks a keyboard interrupt by installing a custom handler
3. Captures keypresses into a buffer
4. Stops on a manual keystroke (via `ReadChar`)
5. Writes the buffer contents to the log file
6. Restores the original interrupt routine and exits

---

## Usage Instructions

1. **Set Up Irvine32**  
   Make sure the Irvine32 library files (`Irvine32.inc`, `.lib`, `.obj`) are correctly included in your project and Visual Studio paths.

2. **Compile the Code**  
   Assemble and link the `keylogger.asm` file in Visual Studio.

3. **Run the Program**  
   Upon execution, the program will start logging key inputs. After you press any key (manually), it will stop logging and write the data to `keylog.txt`.

4. **View Logs**  
   Open `keylog.txt` to review captured keystrokes.

---

## Understanding Keylogger Implementation in Assembly

This program demonstrates core concepts in low-level input capture using Assembly language:

- **Keyboard Interrupt Hooking**  
  The program assigns a custom interrupt handler to capture keyboard input by intercepting system-level interrupts.

- **Interrupt Service Routine (ISR)**  
  The ISR reads key scan codes and places them in a memory buffer. The program ensures that keystrokes are stored without interfering with system stability.

- **Buffer and File I/O**  
  The keystroke buffer is later written to disk using simple file handling procedures.

This basic keylogger design is suitable for learning how input handling works at the hardware-software interface.

---

## Ethical and Legal Use

This software is created strictly for learning purposes. Using keyloggers to collect data without informed consent is a serious violation of privacy laws and professional conduct. Always get permission before testing or deploying monitoring software.

---

## References

1. Kip Irvine – *Assembly Language for x86 Processors*
2. Randall Hyde – *The Art of Assembly Language Programming*
3. Additional documentation on DOS interrupts and low-level keyboard I/O

---
